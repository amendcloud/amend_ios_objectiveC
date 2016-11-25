//
//  CloudAmendImagePickerViewController.h
//  CloudAmend
//
//  Created by Admin on 27/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSImagePickerViewController.h"
#import "Amend.h"
#import "AmendImageView.h"
@interface CloudAmendImagePickerViewController : UIViewController<JSImagePickerViewControllerDelegate,UIGestureRecognizerDelegate,ImageneryDelegate>
- (IBAction)btImagePicker:(id)sender;
- (IBAction)btStartCloudAmend:(id)sender;
@property (weak, nonatomic) IBOutlet AmendImageView *ivPickerImage;
@property (weak, nonatomic) IBOutlet UIImageView *ivImage1;
@property (weak, nonatomic) IBOutlet UIImageView *ivImage2;
@property (weak, nonatomic) IBOutlet UIImageView *ivImage3;
@property (weak, nonatomic) IBOutlet UIView *defaultImageViewOutlet;
@property (weak, nonatomic) IBOutlet UITextField *tfImageNameOutlet;



@end
