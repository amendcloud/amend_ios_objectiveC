//
//  Amend.h
//  Imagetact
//
//  Created by admin on 22/09/16.
//  Copyright © 2016 adminTACT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AmendImageView.h"
#import "AmendOption.h"
@protocol ImageneryDelegate <NSObject>
@required
- (void)didReceiveData:(NSString *)imageId andReqCode:(int) reqCode;
@optional
- (void)didfailedWithError:(NSString *)errorMessage andReqCode:(int) reqCode;


@end


@interface Amend : NSObject{
id <ImageneryDelegate> _delegate;
}


// Upload Image on Server
-(id)initForUpload:(UIImage *)image RequstCode:(int)reqCode Delegate:(id)delegate;


-(void) upload;
-(void) uploadWithImageName:(NSString *)imageName;





-(void)getImage:(NSString *)imageID setOn:(UIImageView *)imageview withOption:(AmendOption *)option;
-(void)getImageByURL:(NSString *)imageURL setOn:(UIImageView *)imageview withOption:(AmendOption *)option;



-(void)getImage:(NSString *)imageID setOn:(UIImageView *)imageview;
-(void)getImageByURL:(NSString *)imageURL setOn:(UIImageView *)imageview;






@end
