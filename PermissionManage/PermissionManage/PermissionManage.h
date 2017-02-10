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
#import <CoreLocation/CoreLocation.h>



typedef void(^RequestPermissionCompletionHandler)(BOOL hasPermission);

///授权类型枚举
typedef NS_ENUM(NSUInteger, AuthorizationStatus) {
  AuthorizationStatusUnDetermined,  //用户还没有关于这个应用程序做出了选择
  AuthorizationStatusDenied,        //用户已经明确否认了这个应用程序的该权限
  AuthorizationStatusAuthorized,    //应用程序拥有该权限
  AuthorizationStatusRestricted     //这个应用程序未被授权访问图片数据，且用户不能更改该应用程序的状态,可能是由于活动的限制,如家长控制到位。
};


@interface PermissionManage : NSObject

///获取摄像头📷权限
+ (AVAuthorizationStatus)getCameraPermissionAuthorizationStatus;

///获取麦克风🎤权限
+ (AVAuthorizationStatus)getMicrophonePermissionAuthorizationStatus;

///获取图库权限 iOS8以后需要添加Photo.framework框架
+ (PHAuthorizationStatus)getPhotoLibraryPermissionAuthorizationStatus;

///获取定位权限
+ (CLAuthorizationStatus)getLocationPermissionAuthorizationStatus;

///请求摄像头权限
+ (void)requestCameraPermissionWithViewController:(UIViewController *)viewController;

///请求麦克风权限
+ (void)requestMicrophonePermissionWithViewController:(UIViewController *)viewController;

///请求图库权限
+ (void)requestPhotoPermissionWithViewController:(UIViewController *)viewController;

///请求使用期间定位权限
+ (void)requestLocationPermissionWithViewController:(UIViewController *)viewController;

@end
