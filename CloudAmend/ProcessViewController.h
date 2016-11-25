//
//  ProcessViewController.h
//  CloudAmend
//
//  Created by Admin on 30/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Amend.h"
#import "AmendImageView.h"
#import "AmendOption.h"
#import "JSImagePickerViewController.h"
@interface ProcessViewController : UIViewController<JSImagePickerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lbfirstOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lbSecondOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lbThirdOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lbFourthOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lbFifthOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lbSixthOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etFirstOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etSecondOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etThirdOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etFourthOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etFifthOutlet;
@property (weak, nonatomic) IBOutlet UITextField *etSixthOutlet;
- (IBAction)btGenerateImageAction:(id)sender;
@property (weak, nonatomic) IBOutlet AmendImageView *ivProcessedImageOutlet;
@property int index;
@property (weak, nonatomic) IBOutlet UIButton *btgenerateOutlet;
@property (strong, nonatomic) NSString  *rootFeature;
@property (strong, nonatomic) NSString  *childFeature;
@property (weak, nonatomic) IBOutlet UIImageView *ivOriginalImageOutlet;
- (IBAction)btImagePickerAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *ivdefaultImageOutlet;
- (IBAction)pickColorAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *pickColorOutlet;
@property (weak, nonatomic) IBOutlet UIButton *stylePickerOutlet;
- (IBAction)stylePickerAction:(id)sender;

@end
