//
//  LayoutHelper.h
//  login
//
//  Created by Longyi Li on 4/1/12.

//

#import <Foundation/Foundation.h>

#define G_SEPERATE(x) ((int)((x)*0.618))

@interface LayoutHelper : NSObject

+ (void) SetOriginFor:(UIView*)in_view withX:(CGFloat)x andY:(CGFloat)y;

+ (void) SetBoundsWidthFor:(UIView*)in_view withWidth:(CGFloat)in_width;

@end
