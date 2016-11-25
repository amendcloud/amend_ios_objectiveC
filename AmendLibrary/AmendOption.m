//
//  AmendOption.m
//  CloudAmend
//
//  Created by admin on 11/11/16.
//  Copyright © 2016 TACT. All rights reserved.
//

#import "AmendOption.h"

@interface AmendOption()



@end
@implementation AmendOption


-(id)transformWidth:(int)width{
    if(width > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        width = 6000;
        
    }
    [self appendString:[NSString stringWithFormat:@"w_%d",width]];
    return  self;
    
}
-(id)transformHeight:(int)height{
    
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"h_%d",height]];
    return  self;
}
-(id)transform:(int )width andHeight:(int)height{
    
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d",width,height]];
    
    return  self;
}
-(id)transform:(int)width andHeight:(int)height andFit:(UIFitState *)fit{
    
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@",width,height,[self getUIFitState:fit]]];
    return  self;
}






-(id)transform:(int)width andHeight:(int)height andAlign:(UIAlignInsideState)align{
    
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@",width,height,[self getUIalighmentInsideStyle:align]]];
    return  self;
}




-(id)transform:(int)width andHeight:(int)height FIT_WIDTH_andAlign:(UIAlignWidthState)align{
    
    NSString *fitType = @"fit_width";
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@,%@",width,height,fitType,[self getUIAlignmentWidth:align]]];
    return  self;
}



-(id)transformFitFace:(int)width andHeight:(int)height{
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,fit_face",width,height]];
    return  self;
}

-(id)transform:(int)width andHeight:(int)height FIT_HEIGHT_andAlign:(UIAlignHeightState)align{
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    NSString *fitType = @"fit_height";
    
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@,%@",width,height,fitType,[self getUIalighmentHeightStyle:align]]];
    return  self;
}



-(id)transform:(int)width andHeight:(int)height FIT_INSIDE_andAlign :(UIAlignInsideState)align{
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    NSString *fitType = @"fit_inside";
    
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@,%@",width,height,fitType,[self getUIalighmentInsideStyle:align]]];
    return  self;
}

-(id)transform:(int)width andHeight:(int)height andOriginX:(int)originX andOriginY:(int)originY{
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,x_%d,y_%d",width,height,originX,originY]];
    
    return  self;
}

-(id)transform:(int)width andHeight:(int)height andFit:(UIFitState)fit andBackGroundColour:(UICOLORLIST)color{
    
    if(height > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@,c_%@",width,height,[self getUIFitState:fit],[self getUIColor:color]]];
    return  self;
}
-(id)transform:(int)width andHeight:(int)height andFit:(UIFitState)fit andBackGroundColourHexCode:(NSString *)ColorHexCode{
    
    if(height > 6000 )
    {
        NSLog(@"Width can not be more then 6000");
        height = 6000;
        
    }
    if(width > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        width = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"w_%d,h_%d,%@,c_%@",width,height,[self getUIFitState:fit],ColorHexCode]];
    
    return  self;
    
}


-(id)crop:(int )value{
    if(value > 6000)
    {
        NSLog(@"Width can not be more then 6000");
        value = 6000;
        
    }
    
    
    [self appendString:[NSString stringWithFormat:@"r_%d",value]];
    return  self;
}

-(id)cropMax{
    
    
    [self appendString:[NSString stringWithFormat:@"r_max"]];
    
    return  self;
}



-(id)quality:(int )value{
    if(value > 6000)
    {
        NSLog(@"Quality value cannot be more then 6000");
        value = 6000;
        
    }
    [self appendString:[NSString stringWithFormat:@"quality_%d",value]];
    return  self;
}
-(id)grayScale{
    
    
    [self appendString:[NSString stringWithFormat:@"grayscale"]];
    return  self;
}
-(id)invert{
    
    
    [self appendString:[NSString stringWithFormat:@"invert"]];
    return  self;
}
-(id)brightness:(int )value{
    
    
    
    
    [self appendString:[NSString stringWithFormat:@"bright_%d",value]];
    return  self;
}
-(id)contrast:(int )value{
    if(value > 6000)
    {
        NSLog(@"contrast value cannot be more then 6000");
        value = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"contrast_%d",value]];
    return  self;
}
-(id)brightness:(int )value andContrast:(int )contrast
{
    if(value > 6000)
    {
        NSLog(@"Brightness can not be more then 6000");
        value = 6000;
        
    }
    if(contrast > 6000)
    {
        NSLog(@"Contrast can not be more then 6000");
        contrast = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"bright_%d,contrast_%d",value,contrast]];
    return  self;
}

-(id)flip:(int )value{
    if(value > 6000)
    {
        NSLog(@"Flip can not be more then 6000");
        value = 6000;
        
    }
    [self appendString:[NSString stringWithFormat:@"flip_%d",value]];
    return  self;
}
-(id)flipType:(UIFlipState )type{
    
    
    [self appendString:[NSString stringWithFormat:@"%@",[self getFlipState:type]]];
    return  self;
}



-(id)rotate:(int )value{
    if(value > 6000)
    {
        NSLog(@"Rotate can not be more then 6000");
        value = 6000;
        
    }
    
    [self appendString:[NSString stringWithFormat:@"rotate_%d",value]];
    return  self;
}




-(id)insertImage:(NSString *)imageUrl{
    
    
    [self appendString:[NSString stringWithFormat:@"oi-%@",imageUrl]];
    
    return self;
}

-(id)insertImage:(NSString *)imageUrl andPositionX :(int)X andPositionY :(int)Y{
    
    
    
    [self appendString:[NSString stringWithFormat:@"oi-%@,x_%d,y_%d",imageUrl,X,Y]];
    return  self;
    
}


-(id)insertText:(NSString *)inserttext andPositionX :(int)X andPositionY :(int)Y andSize:(int)size andStyle:(UIFONTSTYLE)style andColor:(UICOLORLIST )color{
    if(X > 6000)
    {
        NSLog(@"PositionX can not be more then 6000");
        X = 6000;
        
    }
    if(Y > 6000)
    {
        NSLog(@"PositionY can not be more then 6000");
        Y = 6000;
        
    }
    if(size > 6000)
    {
        NSLog(@"Size can not be more then 6000");
        size = 6000;
        
    }
    
    NSString *operationOrder;
    operationOrder = inserttext;
    if(inserttext.length == 0){
        NSLog(@"Please insert Text to perform InsertText");
    }
    
    
    
    [self appendString:[NSString stringWithFormat:@"ot-%@,x_%d,y_%d,size_%d,style_%@,c_%@",inserttext,X,Y,size,[self getUIFont_Style:style],[self getUIColor:color]]];
    
    
    return  self;
}



-(void) appendString : (NSString *)value{
    
    
    if(self.allValue.length ==0){
        self.allValue = value;
        
    }else{
        self.allValue = [self.allValue stringByAppendingString:value];
        
    }
    //    NSLog(@"efvdev %@",self.allValue);
    
}




-(NSString *)getUIAlignmentWidth:(int)Align{
    
    NSString *alignType;
    if(Align==0){
        alignType =@"align_top";
    }else if(Align == 1){
        alignType = @"align_bottom";
    }else if(Align == 2){
        alignType = @"align_center";
    }
    return alignType;
}
-(NSString *)getUIalighmentHeightStyle:(int)Align{
    
    NSString *alignType;
    if(Align==0){
        alignType =@"align_left";
    }else if(Align == 1){
        alignType = @"align_right";
    }else if(Align == 2){
        alignType = @"align_center";
    }
    return alignType;
}


-(NSString *)getUIalighmentInsideStyle:(int)Align{
    
    NSString *alignType;
    if(Align==0){
        alignType =@"align_top";
    }else if(Align == 1){
        alignType = @"align_bottom";
    }else if(Align == 2){
        alignType = @"align_left";
    }else if(Align == 3){
        alignType = @"align_right";
    }else if(Align == 4){
        alignType = @"align_center";
    }
    
    return alignType;
}


-(NSString *)getFlipState:(int)FlipStypeCode{
    
    
    NSString *StyleType;
    
    if(FlipStypeCode==0){
        StyleType = @"flip_x";
    }else if(FlipStypeCode == 1){
        StyleType = @"flip_y";
    }else if(FlipStypeCode == 2){
        StyleType = @"flip_xy";
    }
    
    
    return StyleType;
}
-(NSString *)getUIFitState:(int)fit{
    
    NSString *fitType;
    if(fit==0){
        fitType =@"fit_xy";
    }else if(fit == 1){
        
        
        fitType = @"fit_width";
        
    }else if(fit == 2){
        
        fitType = @"fit_height";
        
        
    }else if(fit == 3){
        
        fitType = @"fit_fill";
        
        
    }else if(fit == 4){
        
        
        fitType = @"fit_inside";
        
    }
    
    return fitType;
}

-(NSString *)getUIFont_Style:(int)UIFONTSTYLE{
    
    NSString *styleType;
    if(UIFONTSTYLE==0){
        styleType =@"normal";
    }else if(UIFONTSTYLE == 1){
        styleType = @"bold";
    }else if(UIFONTSTYLE == 2){
        styleType = @"italic";
    }else if(UIFONTSTYLE == 3){
        styleType = @"underline";
    }else if(UIFONTSTYLE == 4){
        styleType = @"normal";
    }
    
    return styleType;
}



-(NSString *)getUIColor:(int)colorCode{
    
    NSString *color;
    if(colorCode==0){
        color =@"white";
    }else if(colorCode == 1){
        color = @"silver";
    }else if(colorCode == 2){
        color = @"gray";
    }else if(colorCode == 3){
        color = @"black";
    }else if(colorCode == 4){
        color = @"red";
    } if(colorCode==5){
        color =@"maroon";
    }else if(colorCode == 6){
        color = @"yellow";
    }else if(colorCode == 7){
        color = @"olive";
    }else if(colorCode == 8){
        color = @"lime";
    }else if(colorCode == 9){
        color = @"green";
    }else if(colorCode==10){
        color =@"aqua";
    }else if(colorCode == 11){
        color = @"teal";
    }else if(colorCode == 12){
        color = @"blue";
    }else if(colorCode == 13){
        color = @"navy";
    }else if(colorCode == 14){
        color = @"fuchsia";
    }else if(colorCode==15){
        color =@"purple";
    }
    
    
    return color;
}
-(void) clear{
    self.allValue = @"";
    
}
@end
