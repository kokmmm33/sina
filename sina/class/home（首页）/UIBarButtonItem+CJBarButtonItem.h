//
//  UIBarButtonItem+CJBarButtonItem.h
//  sina
//
//  Created by Joseph on 16/1/22.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CJBarButtonItem)

+(UIBarButtonItem *)barButtonWithImage:(UIImage *)image highLightImage:(UIImage *)LightImage controller:(UIViewController *)viewController action:(SEL)action;

@end
