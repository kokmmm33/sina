//
//  CJPopMenu.m
//  sina
//
//  Created by Joseph on 16/1/25.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJPopMenu.h"

#import "UIImage+CZRenderImage.h"



@interface CJPopMenu()

@property(nonatomic,weak)UIView *content;

@end

@implementation CJPopMenu

+(CJPopMenu *)showInRect:(CGRect)rect
{
    CJPopMenu *memu = [[CJPopMenu alloc]initWithFrame:rect];
    
    memu.userInteractionEnabled = YES;
    
    memu.image = [UIImage imageWithStrectchable:@"popover_background"];
    
    [CZKeyWindow addSubview:memu];
    
    return memu;
}

+(void)hide
{
    for (UIView *view in CZKeyWindow.subviews) {
        if ([view isKindOfClass:[CJPopMenu class]]) {
            [view removeFromSuperview];
        }
    }
}

-(void)setContent:(UIView *)content
{
    [_content removeFromSuperview];
    
    content.backgroundColor = [UIColor clearColor];
    
    _content = content;
    
    [self addSubview:_content];
    

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat y = 9;
    CGFloat w = self.w - margin * 2;
    CGFloat h = self.y - margin - 9;
    
    _content.frame = CGRectMake(x, y, w, h);
}
@end
