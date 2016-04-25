//
//  UIButton+CreateNewButton.h
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CreateNewButton)

+(instancetype)buttonWithTitleColorForNomal:(UIColor *)nolColor forHighLight:(UIColor *)highColor target:(id)target action:(SEL)selction title:(NSString *)title;

+(instancetype)buttonWithImageForNomal:(UIImage *)nolImage forHighLight:(UIImage *)highImage target:(id)target action:(SEL)selction title:(NSString *)title;
@end
