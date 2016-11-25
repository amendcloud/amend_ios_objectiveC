//
//  CloudAmendFeaturesListViewController.m
//  CloudAmend
//
//  Created by Admin on 27/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "CloudAmendFeaturesListViewController.h"
# import "ProcessViewController.h"
#import "Support.h"

@interface CloudAmendFeaturesListViewController (){
    NSMutableArray *tableData;
    NSMutableArray *cropAndResizeArray;
    NSInteger *index;
    
}

@end

@implementation CloudAmendFeaturesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate=self;
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CloudAmend" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    cropAndResizeArray=[dict objectForKey:self.rootFeature];
    tableData = [[NSMutableArray alloc] init];
    for (int i=0;i<[cropAndResizeArray count];i++) {
        [tableData addObject:cropAndResizeArray[i][@"Description"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma TableView Data Source
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if(indexPath.row%2 == 0){
        cell.backgroundColor = [Support colorWithHexString:@"FFFFFF"];
           }else{
               cell.backgroundColor = [Support colorWithHexString:@"D9EDF6"];

    }
    cell.textLabel.textColor=[Support colorWithHexString:@"3D4345"];
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}
#pragma TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([tableData[indexPath.row] isEqualToString:@"Multiple Operations"]){
        [self performSegueWithIdentifier:@"multipleImages" sender:self];
    }else{
    
    index=(NSInteger)indexPath.row;
    self.childFeature = tableData[indexPath.row];
    [self performSegueWithIdentifier:@"mastervaluepage" sender:self];
    }
}

#pragma Segue Delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"multipleImages"]){
        
    }
    else{
    ProcessViewController *controller= segue.destinationViewController;
    controller.index=index;
    controller.rootFeature=self.rootFeature;
    controller.childFeature =self.childFeature;
    }
//    childFeature
    
}

@end
