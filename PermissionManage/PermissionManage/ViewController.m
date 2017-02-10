//
//  ViewController.m
//  PermissionManage
//
//  Created by richardhxy on 17/2/9.
//  Copyright © 2017年 iflytek. All rights reserved.
//

#import "ViewController.h"
#import "PermissionManage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)cameraAction:(id)sender {
  [PermissionManage requestCameraPermissionWithViewController:self];
}

- (IBAction)microphoneAction:(id)sender {
  [PermissionManage requestMicrophonePermissionWithViewController:self];
}

- (IBAction)photoAction:(id)sender {
  [PermissionManage requestPhotoPermissionWithViewController:self];
}

- (IBAction)locationAction:(id)sender {
  [PermissionManage requestLocationPermissionWithViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
