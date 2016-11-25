//
//  CloudAmendFeaturesListViewController.h
//  CloudAmend
//
//  Created by Admin on 27/09/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloudAmendFeaturesListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSString  *rootFeature;
@property (strong, nonatomic) NSString  *childFeature;

@end
