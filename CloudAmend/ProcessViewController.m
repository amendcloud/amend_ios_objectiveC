//
//  ProcessViewController.m
//  CloudAmend
//
//  Created by Admin on 30/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "ProcessViewController.h"
#import "GlobalFunction.h"
#import "JSImagePickerViewController.h"

@interface ProcessViewController (){
    //    NSString *feature;
    NSArray *cropAndResizeDict;
    NSDictionary *internaldict;
    NSMutableArray *tableData;
    NSMutableArray *Textfields;
    NSString *rowValue;
    NSString *imageToInsertUrl;
    int colorIndex;
    int styleIndex;
}

@end

@implementation ProcessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideAllScreenElements];
    GlobalFunction *global=[[GlobalFunction alloc]init];
    // Do any additional setup after loading the view.
    
    internaldict=[[NSDictionary alloc] init];
    tableData = [[NSMutableArray alloc] init];
    
    
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [global getDataFromPlist];
    // cropAndResizeDict=[dict objectForKey:feature];
    NSLog(@"%@",cropAndResizeDict);
    
    cropAndResizeDict=[[dict objectForKey:self.rootFeature] mutableCopy];
    internaldict=[cropAndResizeDict objectAtIndex:self.index];
    
    
    
    
    int size=(int) [[internaldict objectForKey:@"TextFieldCount"] count];
    
    NSLog(@"%d",self.index);
    for (int i=0;i<size;i++) {
        
        NSString *valueOfindex =[NSString stringWithFormat:@"%@",cropAndResizeDict[self.index][@"TextFieldCount"][i]];
        [tableData addObject:valueOfindex];
        
        // write to a dictionary instead of an array
        // if you want to keep the keys too.
        
    }
    
    [self showAllScreenElements];
    
    if([tableData count] == 1){
        //        NSString *label=[NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        //        if([label isEqualToString:@"imageUrl"]){
        //            UIButton *addProject = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        //            addProject.frame = CGRectMake(0, self.view.frame.size.height-40, 100,40);
        //            [addProject setTitle:@"Show View" forState:UIControlStateNormal];
        //            [addProject addTarget:self action:@selector(addProjectPressed:) forControlEvents:UIControlEventTouchUpInside];
        //            [self.view addSubview:addProject];
        //}
        
    }
    
    NSArray *value = [cropAndResizeDict valueForKey:@"TextFieldCount"];
    
    NSLog(@"%@",value);
    // NSLog(@"%@",[tableData objectAtIndex:0]);
    
    
    
    //    cropAndResizeDict[i][@"TextFieldCount"] count]
    //    cropAndResizeDict[i][@"TextFieldCount"][j]
    
    
    
}

//- (void)addProjectPressed:(id)sender {
//
//    NSLog(@"fuck");
//}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
    
    //    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)];
    //
    //
    //    [scrollView addSubview:self.ivProcessedImageOutlet];
    //
    //    [scrollView addSubview:_ivOriginalImageOutlet];
    ////    scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    //    [self.view addSubview:scrollView];
}



-(void)showAllScreenElements{
    
    
    
    rowValue = self.childFeature;
    
    
    
    self.btgenerateOutlet.hidden = YES;
    
    if(tableData.count == 0){
        
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.lbfirstOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
        
        
        
    }
    else  if(tableData.count == 1){
        
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.lbSecondOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
        
        
        
    }else if(tableData.count == 2){
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        
        self.lbSecondOutlet.hidden = NO;
        self.etSecondOutlet.hidden = NO;
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.lbSecondOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:1]];
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.lbThirdOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
    }else if(tableData.count == 3){
        
       
        if([rowValue isEqualToString:@"Color"])
        {
            self.etFirstOutlet.hidden = NO;
            self.pickColorOutlet.hidden = NO;
        }
        
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        self.lbSecondOutlet.hidden = NO;
        self.etSecondOutlet.hidden = NO;
        
        self.lbThirdOutlet.hidden = NO;
        self.etThirdOutlet.hidden = NO;
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.lbSecondOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:1]];
        self.lbThirdOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:2]];
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.lbFourthOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
    }else if(tableData.count == 4){
        
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        self.lbSecondOutlet.hidden = NO;
        self.etSecondOutlet.hidden = NO;
        
        self.lbThirdOutlet.hidden = NO;
        self.etThirdOutlet.hidden = NO;
        self.lbFourthOutlet.hidden = NO;
        self.etFourthOutlet.hidden = NO;
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.lbSecondOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:1]];
        self.lbThirdOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:2]];
        self.lbFourthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:3]];
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.etFifthOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
    }else if(tableData.count == 5){
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        self.lbSecondOutlet.hidden = NO;
        self.etSecondOutlet.hidden = NO;
        
        self.lbThirdOutlet.hidden = NO;
        self.etThirdOutlet.hidden = NO;
        
        self.lbFourthOutlet.hidden = NO;
        self.etFourthOutlet.hidden = NO;
        
        self.lbFifthOutlet.hidden = NO;
        self.etFifthOutlet.hidden = NO;
        
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.lbSecondOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:1]];
        self.lbThirdOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:2]];
        self.lbFourthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:3]];
        self.lbFifthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:4]];
        
        
        self.btgenerateOutlet.frame = CGRectMake(self.btgenerateOutlet.frame.origin.x, self.etSixthOutlet.frame.origin.y,self.btgenerateOutlet.frame.size.width,self.btgenerateOutlet.frame.size.height);
        
    }
    
    
    else if(tableData.count == 6){
     
        
        
        self.lbfirstOutlet.hidden = NO;
        self.etFirstOutlet.hidden = NO;
        
        self.lbSecondOutlet.hidden = NO;
        self.etSecondOutlet.hidden = NO;
        
        self.lbThirdOutlet.hidden = NO;
        self.etThirdOutlet.hidden = NO;
        
        self.lbFourthOutlet.hidden = NO;
        self.etFourthOutlet.hidden = NO;
        
        self.lbFifthOutlet.hidden = NO;
        self.etFifthOutlet.hidden = NO;
        self.lbSixthOutlet.hidden = NO;
        self.etSixthOutlet.hidden = NO;
        
        self.lbfirstOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:0]];
        
        self.lbSecondOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:1]];
        self.lbThirdOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:2]];
        self.lbFourthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:3]];
        self.lbFifthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:4]];
        
        self.lbSixthOutlet.text = [NSString stringWithFormat:@"%@",[tableData objectAtIndex:5]];
        if([rowValue isEqualToString:@"Insert Text	,Text,XY,Size,Style"])
        {
            
            self.stylePickerOutlet.hidden = NO;
            self.etSixthOutlet.hidden = NO;
            self.pickColorOutlet.hidden = NO;
            self.pickColorOutlet.frame =  self.etSixthOutlet.frame;
            
        }
        

        
        }
    
    self.btgenerateOutlet.hidden = NO;
    
}


-(void)hideAllScreenElements{
    self.lbfirstOutlet.hidden = YES;
    self.lbSecondOutlet.hidden = YES;
    self.lbThirdOutlet.hidden = YES;
    self.lbFourthOutlet.hidden = YES;
    self.lbFifthOutlet.hidden = YES;
    self.lbSixthOutlet.hidden = YES;
    
    self.etFirstOutlet.hidden = YES;
    self.etSecondOutlet.hidden = YES;
    self.etThirdOutlet.hidden = YES;
    self.etFourthOutlet.hidden = YES;
    self.etFifthOutlet.hidden = YES;
    self.etSixthOutlet.hidden = YES;
    
    self.btgenerateOutlet.hidden = YES;
    
    self.pickColorOutlet.hidden = YES;
    
    
    self.stylePickerOutlet.hidden = YES;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btGenerateImageAction:(id)sender {
    [self.view endEditing:YES];
    [self loadImageBasedOnCondition];
    
}

-(void)loadImageBasedOnCondition{
    
    
    
    
    
    self.ivProcessedImageOutlet.image = nil;
   
    Amend *cloudAmend = [[Amend alloc] init];
    
    
    AmendOption *amendOption = [[AmendOption alloc] init];
    rowValue = self.childFeature;
    
    [amendOption clear];
    
    int fieldCount = tableData.count;
    
    if(fieldCount==0){
        NSLog(@"%@",rowValue);
         if([rowValue isEqualToString:@"Invert"])
        {
            [amendOption invert];
        }
        else if([rowValue isEqualToString:@"For circle"])
        {
            [amendOption cropMax];
        }
        else if([rowValue isEqualToString:@"Grayscale" ])
        {
            
            [amendOption grayScale];
            
        }
        else if([rowValue isEqualToString:@"X" ])
        {
            [amendOption flipType:FLIPX];
        }
        else if([rowValue isEqualToString:@"Y" ])
        {
            [amendOption flipType:FLIPY];
        }
        else if([rowValue isEqualToString:@"XY" ])
        {
            [amendOption flipType:FLIPXY];
        }
    }
    
    else if(fieldCount==1){
       
        if([rowValue isEqualToString:@"insertimage"]){
            [amendOption insertImage:self.etFirstOutlet.text];
        }
        else if ([self.lbfirstOutlet.text isEqualToString:@"Width"])
        {
            //            self.ivProcessedImageOutlet.contentMode = UIViewContentModeScaleAspectFill;
            self.ivProcessedImageOutlet.contentMode = UIViewContentModeLeft;
            self.ivProcessedImageOutlet.clipsToBounds = YES;
            [amendOption transformWidth:[self.etFirstOutlet.text intValue]];
            self.ivProcessedImageOutlet.frame = CGRectMake(10, self.ivProcessedImageOutlet.frame.origin.y, [self.etFirstOutlet.text intValue], self.ivProcessedImageOutlet.frame.size.height);
            
            
        }
        else if([self.lbfirstOutlet.text isEqualToString:@"Height"])
        {
            self.ivProcessedImageOutlet.contentMode = UIViewContentModeLeft;
            self.ivProcessedImageOutlet.clipsToBounds = YES;
            
            [amendOption transformHeight:[self.etFirstOutlet.text intValue]];
            
            self.ivProcessedImageOutlet.frame = CGRectMake(10, self.ivProcessedImageOutlet.frame.origin.y, self.ivProcessedImageOutlet.frame.size.width, [self.etFirstOutlet.text intValue]);
            
        }
        else if([self.lbfirstOutlet.text isEqualToString:@"Rotate"])
        {
            
            [amendOption rotate:[self.etFirstOutlet.text intValue]];
            
            
        }
        else if([self.lbfirstOutlet.text isEqualToString:@"Quality"])
        {
            
            [amendOption quality:[self.etFirstOutlet.text intValue]];
            
            
        }
        else if([self.lbfirstOutlet.text isEqualToString:@"Brightness"])
        {
            
            [amendOption brightness:[self.etFirstOutlet.text intValue]];
            
        }
        else if([self.lbfirstOutlet.text isEqualToString:@"Contrast"])
        {
            
            [amendOption contrast:[self.etFirstOutlet.text intValue]];
            
            
        }
        
        else if([self.lbfirstOutlet.text isEqualToString:@"Radius"])
        {
            [amendOption crop:[self.etFirstOutlet.text intValue]];
            
            
            
        }else if([self.lbfirstOutlet.text isEqualToString:@"imageUrl"]){
            
        }
        
        NSLog(@"Image Url : %@",self.lbfirstOutlet.text);
        
    }
    else if(fieldCount==2){
        if([rowValue isEqualToString: @"Set image size - Width & Height"])
        {
            //tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!)
            [amendOption transform:[self.etFirstOutlet.text intValue] andHeight:[self.etSecondOutlet.text intValue]];
            
        }
        else if([rowValue isEqualToString: @"Fit Image - Fit XY"])
        {
            // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_XY)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_XY];
        }
        else if([rowValue isEqualToString:@"Fit Image - Fit Width"])
        {
            // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_WIDTH)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_WIDTH];
        }
        else if([rowValue isEqualToString: @"Fit Image - Fit Height"])
        {
            //tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_HEIGHT)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_HEIGHT];
        }
        else if([rowValue isEqualToString:@"Fit Image - Fit Fill"])
        {
            // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_FILL)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_FILL];
        }
        else if([rowValue isEqualToString :@"Fit Image - Fit Inside"])
        {
            // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_INSIDE)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_INSIDE];
        }
        
        else if([rowValue isEqualToString :@"Fit Face"])
        {
            // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_INSIDE)
            [amendOption transformFitFace:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue]];
        }
        //                     else if([rowValue isEqualToString:@"Fit Image - Fit Inside"])
        //            {
        //               // tactLab.transform(Width: Int(self.textfield1.text!)!, Height: Int(self.textfield2.text!)!, Fit: UIFitState.FIT_INSIDE)
        //                 [cloudAmend transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] andFit:FIT_FILL];
        //            }
        else if([rowValue isEqualToString :@"Align Image - Align Left" ])
        {
            // tactLab.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_LEFT)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] FIT_HEIGHT_andAlign:H_ALIGN_LEFT];
        }
        else if([rowValue isEqualToString: @"Align Image - Align Right"])
        {
            // tactLab.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_RIGHT)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] FIT_HEIGHT_andAlign:H_ALIGN_RIGHT];
        }
        else if([rowValue isEqualToString: @"Align Image - Align Center"])
        {
            // tactLab.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_HEIGHT_andAlign: UIAlignHeightState.H_ALIGN_CENTER)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] FIT_HEIGHT_andAlign:H_ALIGN_CENTER];
        }
        else if([rowValue isEqualToString: @"Align Image - Align Top"])
        {
            // tactLab.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_WIDTH_andAlign: UIAlignWidthState.W_ALIGN_TOP)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] FIT_WIDTH_andAlign:W_ALIGN_TOP];
        }
        else if([rowValue isEqualToString: @"Align Image - Align Bottom"])
        {
            // tactLab.transform(Height: Int(self.textfield2.text!)!, Width: Int(self.textfield1.text!)!, FIT_WIDTH_andAlign: UIAlignWidthState.W_ALIGN_BOTTOM)
            [amendOption transform:[self.etFirstOutlet.text intValue]  andHeight:[self.etSecondOutlet.text intValue] FIT_WIDTH_andAlign:W_ALIGN_BOTTOM];
            
        }
        else if([rowValue isEqualToString: @"Brightness & Contrast"])
        {
            //tactLab.BrightnessAndContrast(Brightness: Int(self.textfield1.text!)!, Contrast: Int(self.textfield2.text!)!)
            [amendOption brightness:[self.etFirstOutlet.text intValue]  andContrast:[self.etSecondOutlet.text intValue] ];
        }
    }
    else if(fieldCount==3){
        
        
        
        if([rowValue isEqualToString:@"insertimage,x_,y_"])
        {
              [amendOption insertImage:self.etFirstOutlet.text  andPositionX:[self.etSecondOutlet.text intValue] andPositionY:[self.etThirdOutlet.text intValue]];
            
            //                tactLab.insertImage(ImageUrl: self.textfield1.text! as NSString, OriginX: Int(self.textfield2.text!)!, OriginY: Int(self.textfield3.text!)!)
        }else if([rowValue isEqualToString:@"Color"])
        {
            
//            [NSString stringWithFormat:@"%@",self.etFirstOutlet.text]
            
            
            
            [amendOption transform:[self.etSecondOutlet.text intValue] andHeight:[self.etThirdOutlet.text intValue] andFit:FIT_INSIDE andBackGroundColour:colorIndex];
            
        }
    }
    
    else if(fieldCount==4){
        if([rowValue isEqualToString:@"Origin"])
        {
            
            self.ivProcessedImageOutlet.contentMode = UIViewContentModeLeft;
            self.ivProcessedImageOutlet.clipsToBounds = YES;
            [amendOption transform:[self.etFirstOutlet.text intValue] andHeight:[self.etSecondOutlet.text intValue] andOriginX:[self.etThirdOutlet.text intValue] andOriginY:[self.etFourthOutlet.text intValue]];
            self.ivProcessedImageOutlet.frame = CGRectMake(10, self.ivProcessedImageOutlet.frame.origin.y, [self.etFirstOutlet.text intValue], self.ivProcessedImageOutlet.frame.size.height);
            
        }
    }
    else if(fieldCount==6){
        if([rowValue isEqualToString:@"Insert Text	,Text,XY,Size,Style"])
        {
            [amendOption insertText:self.etFirstOutlet.text andPositionX:[self.etSecondOutlet.text intValue] andPositionY:[self.etThirdOutlet.text intValue] andSize:[self.etFourthOutlet.text intValue] andStyle:styleIndex andColor:colorIndex];
            
        }
    }
    
    // NSLog(@"%@",[cloudAmend getImage:@""]);
    
    int ImageUrl = [[NSUserDefaults standardUserDefaults] integerForKey:@"ImageUrl"];
    
    if([rowValue isEqualToString:@"Default Image" ])
    {
        
        if(ImageUrl == 0){
            
            
            [cloudAmend getImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"imageId"] setOn:self.ivProcessedImageOutlet];
        }else{
            
            [cloudAmend getImageByURL:[[NSUserDefaults standardUserDefaults] objectForKey:@"imageId"] setOn:self.ivProcessedImageOutlet];
        }
    }else{
        
    if(ImageUrl == 0){
    
        
        [cloudAmend getImage:[[NSUserDefaults standardUserDefaults] objectForKey:@"imageId"] setOn:self.ivProcessedImageOutlet withOption:amendOption];
    }else{
        
        [cloudAmend getImageByURL:[[NSUserDefaults standardUserDefaults] objectForKey:@"imageId"] setOn:self.ivProcessedImageOutlet withOption:amendOption];
     }

  
    }
    
    
}
- (IBAction)btImagePickerAction:(id)sender {
    
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
        // Distructive button tapped.
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Web" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        [self btGetImageFromUrl];
        
        
    }]];
    
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"From Default " style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        [self showDefaultImageView];
        
        
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}

-(void)showDefaultImageView{
    [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ivdefaultImageOutlet.frame  = CGRectMake(self.ivdefaultImageOutlet.frame.origin.x, self.ivdefaultImageOutlet.frame.origin.y, self.ivdefaultImageOutlet.frame.size.width,self.ivdefaultImageOutlet.frame.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.ivdefaultImageOutlet.frame  = CGRectMake(self.ivdefaultImageOutlet.frame.origin.x, self.ivdefaultImageOutlet.frame.origin.y-self.ivdefaultImageOutlet.frame.size.height-30, self.ivdefaultImageOutlet.frame.size.width,self.ivdefaultImageOutlet.frame.size.height);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}

- (void)imagePicker:(JSImagePickerViewController *)imagePicker didSelectImage:(UIImage *)image {
    self.ivProcessedImageOutlet.image = image;
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
                                                             
                                                             imageToInsertUrl=url;
                                                             
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
- (IBAction)setImage1:(id)sender {
    
    //  uploadImage=1;
    //    imageToUpload = [UIImage imageNamed:@"stevejobs.jpg"];
    //    self.ivPickerImage.image=imageToUpload;
    
    [self setImageOnImageView:@"stevejobs.jpg"];
    
    //[self performSegueWithIdentifier:@"cloudamendfeatures" sender:self];
}

- (IBAction)setImage2:(id)sender {
    //uploadImage=2;
    //    imageToUpload=[UIImage imageNamed:@"deepika.jpeg"];
    //    self.ivPickerImage.image=imageToUpload;
    
    
    
    [self setImageOnImageView:@"deepika.jpeg"];
}

- (IBAction)setImage3:(id)sender {
    //uploadImage=3;
    
    [self setImageOnImageView:@"shahrukh.jpg"];
    
    
}

-(void)setImageOnImageView:(NSString *)imageName{
    [self HideDefaultImageView];
    UIImage *imageToUpload=[[UIImage alloc ] init];
    imageToUpload =[UIImage imageNamed:imageName];
    self.ivProcessedImageOutlet.image=imageToUpload;
}

-(void)HideDefaultImageView{
    [UIView animateWithDuration:0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.ivdefaultImageOutlet.frame  = CGRectMake(self.ivdefaultImageOutlet.frame.origin.x, self.ivdefaultImageOutlet.frame.origin.y, self.ivdefaultImageOutlet.frame.size.width,self.ivdefaultImageOutlet.frame.size.height);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.ivdefaultImageOutlet.frame  = CGRectMake(self.ivdefaultImageOutlet.frame.origin.x, self.ivdefaultImageOutlet.frame.origin.y+self.ivdefaultImageOutlet.frame.size.height+30, self.ivdefaultImageOutlet.frame.size.width,self.ivdefaultImageOutlet.frame.size.height);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}


- (IBAction)pickColorAction:(id)sender {
    
    if([rowValue isEqualToString:@"Color"] || [rowValue isEqualToString:@"Insert Text	,Text,XY,Size,Style"])
    {
        NSArray *numbersArrayList = @[@"WHITE", @"SILVER", @"BLACK", @"RED", @"MAROON", @"YELLOW" , @"OLIVE", @"LIME", @"GREEN", @"AQUA", @"TEAL", @"BLUE" , @"NAVY", @"FUCHSIA", @"PURPLE"];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Numbers:"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    for (int j =0 ; j<numbersArrayList.count; j++){
        NSString *titleString = numbersArrayList[j];
        UIAlertAction *action = [UIAlertAction actionWithTitle:titleString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//            NSLog(@"Selected Value: %@",numbersArrayList[j]);
            
            if([rowValue isEqualToString:@"Color"]){
            self.etFirstOutlet.text = numbersArrayList[j];
            }else{
                self.etSixthOutlet.text = numbersArrayList[j];
                
            }
            colorIndex = j+1;
            
        }];

        [alertController addAction:action];
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                         }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)stylePickerAction:(id)sender {
    
    
    if([rowValue isEqualToString:@"Insert Text	,Text,XY,Size,Style"])
    {
        
        NSArray *numbersArrayList = @[@"NORMAL", @"BOLD", @"ITALIC", @"UNDERLINE"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Numbers:"
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleActionSheet];
        for (int j =0 ; j<numbersArrayList.count; j++){
            NSString *titleString = numbersArrayList[j];
            UIAlertAction *action = [UIAlertAction actionWithTitle:titleString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                //            NSLog(@"Selected Value: %@",numbersArrayList[j]);
                
              
                    self.etFifthOutlet.text = numbersArrayList[j];
                    
                styleIndex = j;
                
            }];
            
            [alertController addAction:action];
        }
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction *action) {
                                                             }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
