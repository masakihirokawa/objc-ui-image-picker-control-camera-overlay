//
//  ViewController.m
//  UIImagePickerControlCameraOverlay
//
//  Created by Dolice on 2013/07/07.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

#pragma mark CameraOverlayView

@implementation CameraOverlayView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.pickerController takePicture];
}

@end

#pragma mark ViewController

@interface ViewController ()

@property UIImagePickerController *pickerController;
@property UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //撮影画像を表示するイメージビュー配置
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = self.view.bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_imageView];
}

//カメラボタンを押した時のイベント
- (IBAction)cameraButtonEvent:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //カメラが有効であれば撮影モードに入る
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.showsCameraControls = NO;
        UIImage *image = [UIImage imageNamed:@"scope.png"];
        CameraOverlayView *overlayView = [[CameraOverlayView alloc] initWithImage:image];
        overlayView.pickerController = picker;
        overlayView.frame = picker.view.bounds;
        overlayView.contentMode = UIViewContentModeScaleAspectFill;
        overlayView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayView.alpha = 0.5;
        overlayView.userInteractionEnabled = YES;
        picker.cameraOverlayView = overlayView;
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        //カメラが無効であればエラーログを出力する
        NSLog(@"UIImagePickerController is not available.");
    }
}

//選択/撮影した写真を取得
- (void)imagePickerController:(UIImagePickerController*)picker
didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    _imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
