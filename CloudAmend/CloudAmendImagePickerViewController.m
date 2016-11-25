//
//  CloudAmendImagePickerViewController.m
//  CloudAmend
//
//  Created by Admin on 27/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "CloudAmendImagePickerViewController.h"
#import "AccessApi.h"
#import "Amend.h"
#import "ProgressHUD.h"
#import "AmendImageView.h"


@interface CloudAmendImagePickerViewController (){
    
    UIImage *imageToUpload;
    int uploadImage;
    ProgressHUD *loader;
    BOOL showDefaultImage;
    
    
}

@end

@implementation CloudAmendImagePickerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _ivPickerImage.image=[UIImage imageNamed:@"placeholder.png"];
    
    //    // Create the colors
    //    UIColor *topColor = [UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:0.6];
    //    UIColor *bottomColor = [UIColor colorWithRed:80/255.0 green:90/255.0 blue:100/255.0 alpha:1.0];
    //
    //    // Create the gradient
    //    CAGradientLayer *theViewGradient = [CAGradientLayer layer];
    //    theViewGradient.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    //    theViewGradient.frame = self.view.bounds;
    //
    //    //Add gradient to view
    //    [self.view.layer insertSublayer:theViewGradient atIndex:0];
    
    showDefaultImage = true;
    
    
    uploadImage=2;
    imageToUpload=[UIImage imageNamed:@"deepika.jpeg"];
    
    
    // Do any additional setup after loading the view.
    self.ivPickerImage.contentMode = UIViewContentModeScaleAspectFit;
    //  self.ivPickerImage.backgroundColor = [UIColor colorWithRed:0.616 green:0.825 blue:1.000 alpha:1.000];
    
    //    self.showButton.layer.masksToBounds = YES;
    //    self.showButton.layer.cornerRadius = 3;
    self.ivPickerImage.layer.masksToBounds = YES;
    self.ivPickerImage.layer.cornerRadius = 3;
    
    
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    UIView *view = tapGestureRecognizer.view; //cast pointer to the derived class if needed
    NSLog(@"%ld", (long)view.tag);
    
    if([self.ivImage1 tag] == 1 ){
        
    }
    
}

- (IBAction)setImage1:(id)sender {
    
    uploadImage=1;
    //    imageToUpload = [UIImage imageNamed:@"stevejobs.jpg"];
    //    self.ivPickerImage.image=imageToUpload;
    
    [self setImageOnImageView:@"stevejobs.jpg"];
    
    //[self performSegueWithIdentifier:@"cloudamendfeatures" sender:self];
}

- (IBAction)setImage2:(id)sender {
    uploadImage=2;
    //    imageToUpload=[UIImage imageNamed:@"deepika.jpeg"];
    //    self.ivPickerImage.image=imageToUpload;
    
    
    
    [self setImageOnImageView:@"deepika.jpeg"];
}

- (IBAction)setImage3:(id)sender {
    uploadImage=3;
    
    [self setImageOnImageView:@"shahrukh.jpg"];
    
    
}
-(void)setImageOnImageView:(NSString *)imageName{
    [self HideDefaultImageView];
    
    imageToUpload =[UIImage imageNamed:imageName];
    self.ivPickerImage.image=imageToUpload;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePicker:(JSImagePickerViewController *)imagePicker didSelectImage:(UIImage *)image {
    self.ivPickerImage.image = image;
}

- (IBAction)btImagePicker:(id)sender {
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Load Image" message:@"Select Image From Device and Web" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Device" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        JSImagePickerViewController *imagePicker = [[JSImagePickerViewController alloc] init];
        imagePicker.delegate = self;
        [imagePicker showImagePickerInController:self animated:YES];
        [self HideDefaultImageView];
        
        // Distructive button tapped.
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Web" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        [self btGetImageFromUrl];
        [self HideDefaultImageView];
        
        
    }]];
    
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Default " style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        
        if(showDefaultImage){
            
            [self showDefaultImageView];
        }
        
        
        
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    
    
    
    
}

-(void)showDefaultImageView{
    showDefaultImage =  false;
    
    [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.defaultImageViewOutlet.frame  = CGRectMake(self.defaultImageViewOutlet.frame.origin.x, self.defaultImageViewOutlet.frame.origin.y, self.defaultImageViewOutlet.frame.size.width,self.defaultImageViewOutlet.frame.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.defaultImageViewOutlet.frame  = CGRectMake(self.defaultImageViewOutlet.frame.origin.x, self.defaultImageViewOutlet.frame.origin.y-self.defaultImageViewOutlet.frame.size.height-30, self.defaultImageViewOutlet.frame.size.width,self.defaultImageViewOutlet.frame.size.height);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}

-(void)HideDefaultImageView{
    
    showDefaultImage =  true;
    
    [UIView animateWithDuration:0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.defaultImageViewOutlet.frame  = CGRectMake(self.defaultImageViewOutlet.frame.origin.x, self.defaultImageViewOutlet.frame.origin.y, self.defaultImageViewOutlet.frame.size.width,self.defaultImageViewOutlet.frame.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.defaultImageViewOutlet.frame  = CGRectMake(self.defaultImageViewOutlet.frame.origin.x, self.defaultImageViewOutlet.frame.origin.y+self.defaultImageViewOutlet.frame.size.height+30, self.defaultImageViewOutlet.frame.size.width,self.defaultImageViewOutlet.frame.size.height);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}

- (IBAction)btStartCloudAmend:(id)sender {
    
    //  [self performSegueWithIdentifier:@"cloudamendfeatures" sender:self];
    
    if ([UIImagePNGRepresentation(self.ivPickerImage.image) isEqualToData:UIImagePNGRepresentation([UIImage imageNamed:@"placeholder.png"])]){
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Cloud Amend"
                                      message:@"select a image!!"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                             }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        [self showLoadingMode];
        if(self.tfImageNameOutlet.text.length == 0 ){
            [[[[Amend alloc] init]  initForUpload:self.ivPickerImage.image RequstCode:0 Delegate:self] upload];
        }else{
            [[[[Amend alloc] init] initForUpload:self.ivPickerImage.image RequstCode:0 Delegate:self] uploadWithImageName:self.tfImageNameOutlet.text];
        }
    }
    
    
}




-(void)didReceiveData:(NSString *)imageId andReqCode:(int)reqCode{
    
    [self hideLoadingMode];
    NSLog(@"%@",imageId);
    [[NSUserDefaults standardUserDefaults ] setObject:imageId forKey:@"imageId"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"ImageUrl"];
    [self performSegueWithIdentifier:@"cloudamendfeatures" sender:self];
}

-(void)didfailedWithError:(NSString *)errorMessage andReqCode:(int)reqCode{
    
    [self hideLoadingMode];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Failed to Upload Image" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    NSLog(@"%@",errorMessage);
}

-(void)showLoadingMode {
    loader = [[ProgressHUD alloc]init];
    [loader showHudProgress:self.view];
    
}

-(void)hideLoadingMode {
    
    
    [loader hideHudProgress];
}
- (void)btGetImageFromUrl{
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Please enter Image URL"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // optionally configure the text field
        textField.keyboardType = UIKeyboardTypeAlphabet;
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                         UITextField *textField = [alert.textFields firstObject];
                                                         
                                                         NSLog(@"%@",textField.text);
                                                         
                                                         
                                                         NSString *url;
                                                         url=textField.text;
                                                         if(url.length>1){

                                                             
                                                             
                                                             self.ivPickerImage.amendURL=[NSURL URLWithString:url];
                                                             [[NSUserDefaults standardUserDefaults]setObject:url forKey:@"imageId"];
                                                             [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"ImageUrl"];
                                                             [self performSegueWithIdentifier:@"cloudamendfeatures" sender:self];
                                                         }else{
                                                             //[self.view ]
                                                         }
                                                         
                                                         
                                                     }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             UITextField *textField = [alert.textFields firstObject];
                                                             
                                                             NSLog(@"%@",textField.text);
                                                             
                                                         }];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    //    if ([self.etImageUrl isFirstResponder] && [touch view] != self.etImageUrl) {
    //        [self.etImageUrl resignFirstResponder];
    //    }
    [super touchesBegan:touches withEvent:event];
}
@end
