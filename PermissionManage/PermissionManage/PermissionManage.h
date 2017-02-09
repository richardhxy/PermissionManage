//
//  PermissionManage.h
//  PermissionManage
//
//  Created by richardhxy on 17/2/9.
//  Copyright © 2017年 iflytek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>


@interface PermissionManage : NSObject

///获取摄像头📷权限
+ (AVAuthorizationStatus)getCameraPermissionAuthorizationStatus;

///获取麦克风🎤权限
+ (AVAuthorizationStatus)getMicroPhonePermissionAuthorizationStatus;

///获取图库权限
+ (PHAuthorizationStatus)getPhotoLibraryPermissionAuthorizationStatus;


@end
