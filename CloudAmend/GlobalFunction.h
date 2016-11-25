//
//  GlobalFunction.h
//  CloudAmend
//
//  Created by Admin on 03/10/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalFunction : NSObject



-(NSDictionary *) getDataFromPlist;
-(NSArray *) getKeysFromPlist;
-(NSDictionary *) getDictionary:(NSString *)key;
-(NSArray *) getArray:(NSString *)key;


@end
