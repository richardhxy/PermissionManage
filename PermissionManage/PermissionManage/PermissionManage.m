//
//  PermissionManage.m
//  PermissionManage
//
//  Created by richardhxy on 17/2/9.
//  Copyright © 2017年 iflytek. All rights reserved.
//

#import "PermissionManage.h"

static CLLocationManager *lm = nil;

@implementation PermissionManage

//AVMediaTypeVideo
//AVMediaTypeAudio
+ (AVAuthorizationStatus)getCameraPermissionAuthorizationStatus {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
}

+ (AVAuthorizationStatus)getMicrophonePermissionAuthorizationStatus {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
}

+ (PHAuthorizationStatus)getPhotoLibraryPermissionAuthorizationStatus {
    return [PHPhotoLibrary authorizationStatus];
}

+ (CLAuthorizationStatus)getLocationPermissionAuthorizationStatus {
  return [CLLocationManager authorizationStatus];
}

+ (void)requestCameraPermissionWithViewController:(UIViewController *)viewController {
  [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                           completionHandler:^(BOOL granted) {
                             if (!granted) {
                               [PermissionManage showAlertViewControllerWithTitle:@"友情提示" message:@"App需要访问照相机才能为您更好的服务" viewController:viewController];
                             }
                           }];
}

+ (void)showAlertViewControllerWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)viewController{
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
  UIAlertAction *goToSettingAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
  }];
  [alertController addAction:cancelAction];
  [alertController addAction:goToSettingAction];
  dispatch_async(dispatch_get_main_queue(), ^{
    [viewController presentViewController:alertController animated:YES completion:nil];
  });
  
}

+ (void)requestMicrophonePermissionWithViewController:(UIViewController *)viewController {
  [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
    if (!granted) {
      [PermissionManage showAlertViewControllerWithTitle:@"友情提示" message:@"App需要访问麦克风才能为您更好的服务" viewController:viewController];
    }
  }];
}

+ (void)requestPhotoPermissionWithViewController:(UIViewController *)viewController {
  [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
    switch (status) {
      case PHAuthorizationStatusDenied:{
        [PermissionManage showAlertViewControllerWithTitle:@"友情提示" message:@"App需要访问图库才能为您更好的服务" viewController:viewController];
        break;
      }
      default:
        break;
    }
  }];
}

+ (void)requestLocationPermissionWithViewController:(UIViewController *)viewController {
  BOOL locationServiceEnable = [CLLocationManager locationServicesEnabled];
  if (locationServiceEnable) {
    CLAuthorizationStatus locationStatus = [PermissionManage getLocationPermissionAuthorizationStatus];
    switch (locationStatus) {
      case kCLAuthorizationStatusDenied:
      {
        [PermissionManage showAlertViewControllerWithTitle:@"友情提示" message:@"App需要访问地理位置才能为您更好的服务" viewController:viewController];
        break;
      }
        
      case kCLAuthorizationStatusNotDetermined:
      {
        lm = [[CLLocationManager alloc]init];
        [lm requestWhenInUseAuthorization];
        [lm startUpdatingLocation];
        break;
      }
      default:
        break;
    }
  }
}



@end
