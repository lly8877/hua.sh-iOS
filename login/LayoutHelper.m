//
//  LayoutHelper.m
//  login
//
//  Created by Longyi Li on 4/1/12.
//  Copyright (c) 2012 Oracle. All rights reserved.
//

#import "LayoutHelper.h"

@implementation LayoutHelper

+ (void) SetOriginFor:(UIView*)in_view withX:(CGFloat)x andY:(CGFloat)y
{
    if (in_view) 
    {
        in_view.frame = CGRectMake(x, y, in_view.bounds.size.width, in_view.bounds.size.height);
    }
    return;
}

+ (void) SetFrameWidthFor:(UIView*)in_view withWidth:(CGFloat)in_width
{
    if (in_view)
    {
        in_view.frame = CGRectMake(
                                   (int)in_view.frame.origin.x,
                                   (int)in_view.frame.origin.y,
                                   (int)in_width,
                                   (int)in_view.frame.size.height
                                   );
    }
}

+ (void) SetBoundsWidthFor:(UIView*)in_view withWidth:(CGFloat)in_width
{
    if (in_view)
    {
        in_view.bounds = CGRectMake(
                                    (int)in_view.bounds.origin.x,
                                    (int)in_view.bounds.origin.y,
                                    (int)in_width,
                                    (int)in_view.bounds.size.height
                                    );
    }
}

@end
