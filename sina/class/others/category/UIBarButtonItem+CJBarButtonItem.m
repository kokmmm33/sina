//
//  UIBarButtonItem+CJBarButtonItem.m
//  sina
//
//  Created by Joseph on 16/1/22.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "UIBarButtonItem+CJBarButtonItem.h"

@implementation UIBarButtonItem (CJBarButtonItem)

+(UIBarButtonItem *)barButtonWithImage:(UIImage *)image highLightImage:(UIImage *)LightImage target:(id)target action:(SEL)action forControlEvent:(UIControlEvents)UIControlEvent
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:image forState:UIControlStateNormal];
    
    [button setImage:LightImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEvent];
    
    [button sizeToFit];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    


}

@end
