//
//  ViewController.m
//  CloudAmend
//
//  Created by Admin on 27/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "CloudAmendFeaturesViewController.h"
#import "CloudAmendFeaturesListViewController.h"
#import "GlobalFunction.h"
#import "Support.h"

@interface CloudAmendFeaturesViewController (){
    
    NSArray *tableData;
    NSString *rootFeature;
}

@end

@implementation CloudAmendFeaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    // Enable delegate and dataSource Function of TableView
  
    tableData=[NSMutableArray array];
   // Allocate and Initialize
    
    // Global Class is used to access Plist data
   GlobalFunction * global = [[GlobalFunction alloc]init ];

    // Store root data from Plist
    tableData=[global getKeysFromPlist];
   
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cloudAmendTableIdentifier = @"CloudAmend";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cloudAmendTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cloudAmendTableIdentifier];
    }
    if(indexPath.row%2 == 0){
        cell.backgroundColor = [Support colorWithHexString:@"FFFFFF"];

            }else{
        
                cell.backgroundColor = [Support colorWithHexString:@"D9EDF6"];
               
    }
cell.textLabel.textColor=[Support colorWithHexString:@"3D4345"];
   // cell.selectedBackgroundView.backgroundColor=[Support colorWithHexString:@""];
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}


#pragma TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    rootFeature = tableData[indexPath.row];
    [self performSegueWithIdentifier:@"cloudamendfeaturelist" sender:self];
    
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CloudAmendFeaturesListViewController *controller= segue.destinationViewController;
    controller.rootFeature=rootFeature;
}

@end
