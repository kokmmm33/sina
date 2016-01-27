//
//  CJTitleButton.m
//  sina
//
//  Created by Joseph on 16/1/22.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJTitleButton.h"
#import "UIView+view.h"
#import "UIImage+CZRenderImage.h"

@implementation CJTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setBackgroundImage:[UIImage imageWithStrectchable:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];

        
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 60, 0,0);
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0,40);
        
    }
    return self;
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    if (self.currentImage == nil)
//        
//        return;
//    self.titleLabel.x = self.imageView.x;
//    
//    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
//
//
//    
//}


//-(void)setTitle:(NSString *)title forState:(UIControlState)state
//{
//    [super setTitle:title forState:state];
//    
//    [self sizeToFit];
//
//}
//
//-(void)setImage:(UIImage *)image forState:(UIControlState)state
//{
//    [super setImage:image forState:state];
//    
//    [self sizeToFit];
//
//}

@end
