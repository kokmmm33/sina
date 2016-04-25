//
//  CJCover.m
//  sina
//
//  Created by Joseph on 16/1/22.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJCover.h"

@implementation CJCover

+(instancetype)show
{
    CJCover *cover = [[CJCover alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    cover.alpha = 1;
    
    cover.backgroundColor = [UIColor clearColor];
    
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
    return cover;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
    
    if ([_delegate respondsToSelector:@selector(DidClickedCover:)]) {
        [_delegate DidClickedCover:self];
    }
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self removeFromSuperview];
//    
//    if ([_delegate respondsToSelector:@selector(DidClickedCover:)]) {
//        [_delegate DidClickedCover:self];
//    }
//}
@end
