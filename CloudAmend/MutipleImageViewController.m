//
//  MutipleImageViewController.m
//  CloudAmend
//
//  Created by admin on 11/11/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "MutipleImageViewController.h"
#import "Amend.h"

@interface MutipleImageViewController ()



- (IBAction)btgenerateAction:(id)sender;

@end

@implementation MutipleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btgenerateAction:(id)sender {
    
    
    
    [[[Amend alloc]initForUpload:self.imageView1.image RequstCode:1 Delegate:self]upload];
    [[[Amend alloc]initForUpload:self.imageView2.image RequstCode:2 Delegate:self]upload];
    [[[Amend alloc]initForUpload:self.imageView3.image RequstCode:3 Delegate:self]upload];
    [[[Amend alloc]initForUpload:self.imageView4.image RequstCode:4 Delegate:self]upload];
}

-(void)didReceiveData:(NSString *)imageId andReqCode:(int)reqCode{
    
//    [self hideLoadingMode];
    Amend *amend = [[Amend alloc]init];
    NSLog(@"aaa %@",imageId);
    
    if(reqCode==1){
        
        
        AmendOption *amendObject = [[AmendOption alloc]init];
        [amendObject invert];
        [amend getImage:imageId setOn:self.imageView1 withOption:amendObject];

    }
    else if(reqCode==2){
        AmendOption *amendObject = [[AmendOption alloc]init];
        [amendObject cropMax];
        [amend getImage:imageId setOn:self.imageView2 withOption:amendObject];

    }
    else if(reqCode==3){
        AmendOption *amendObject = [[AmendOption alloc]init];
        [amendObject grayScale];
        [amend getImage:imageId setOn:self.imageView3 withOption:amendObject];

    }
    else if(reqCode==4){
        AmendOption *amendObject = [[AmendOption alloc]init];
        [amendObject invert];
        [amend getImage:imageId setOn:self.imageView4 withOption:amendObject];

    }
    
    
}

-(void)didfailedWithError:(NSString *)errorMessage andReqCode:(int)reqCode{
    
//    [self hideLoadingMode];
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
@end
