//
//  UIImage+CZRenderImage.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "UIImage+CZRenderImage.h"

@implementation UIImage (CZRenderImage)
+(instancetype)imageWithOriginalImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}

@end
