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
#define TITLEBUTTONMARGIN 5
#define TITLEBUTTONIMAGEWIDTH 35

@implementation CJTitleButton

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
        
        [self setBackgroundImage:[UIImage imageWithStrectchable:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    NSLog(@"%s",__func__);
    
    [super layoutSubviews];
    if (self.currentImage == nil)
        return;
    
    NSLog(@"99999999*--%fd----%f",self.titleLabel.x,self.imageView.x);
    self.titleLabel.x = self.imageView.x;
    
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    

}

-(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    [super setBackgroundImage:image forState:state];
    
    [self sizeToFit];

}
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];

}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self sizeToFit];

}

@end
