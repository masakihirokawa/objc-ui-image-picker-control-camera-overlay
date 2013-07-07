//
//  ViewController.h
//  UIImagePickerControlCameraOverlay
//
//  Created by Dolice on 2013/07/07.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraOverlayView : UIImageView

@property UIImagePickerController *pickerController;

@end

@interface ViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)cameraButtonEvent:(id)sender;

@end
