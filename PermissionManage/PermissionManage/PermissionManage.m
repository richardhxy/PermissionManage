//
//  PermissionManage.m
//  PermissionManage
//
//  Created by richardhxy on 17/2/9.
//  Copyright © 2017年 iflytek. All rights reserved.
//

#import "PermissionManage.h"

@implementation PermissionManage

//AVMediaTypeVideo
//AVMediaTypeAudio
+ (AVAuthorizationStatus)getCameraPermissionAuthorizationStatus {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
}

+ (AVAuthorizationStatus)getMicroPhonePermissionAuthorizationStatus {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
}

+ (PHAuthorizationStatus)getPhotoLibraryPermissionAuthorizationStatus {
    return [PHPhotoLibrary authorizationStatus];
}



@end
