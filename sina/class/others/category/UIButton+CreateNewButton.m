//
//  UIButton+CreateNewButton.m
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "UIButton+CreateNewButton.h"

@implementation UIButton (CreateNewButton)

+(instancetype)buttonWithTitleColorForNomal:(UIColor *)nolColor forHighLight:(UIColor *)highColor target:(id)target action:(SEL)selction title:(NSString *)title
{
    UIButton *button = [self buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:nolColor forState:UIControlStateNormal];
    
    [button setTitleColor:highColor forState:UIControlStateHighlighted];
    
    [button addTarget:target action:selction forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    return button;
}

+(instancetype)buttonWithImageForNomal:(UIImage *)nolImage forHighLight:(UIImage *)highImage target:(id)target action:(SEL)selction title:(NSString *)title
{
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [button.imageView sizeToFit];
    
    [button setImage:nolImage forState:UIControlStateNormal];
    
    [button setImage:highImage forState:UIControlStateHighlighted];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:target action:selction forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    
    return button;
}




@end
