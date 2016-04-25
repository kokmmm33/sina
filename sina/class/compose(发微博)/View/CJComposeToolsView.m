//
//  CJComposeToolsView.m
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJComposeToolsView.h"
#import "UIButton+CreateNewButton.h"

@interface CJComposeToolsView()
@property(nonatomic,weak)UIView *pleaseHolder;

@end

@implementation CJComposeToolsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addtools];
    }

    return self;
}

-(void)addtools
{
    
    //相册
    UIButton *photoButton = [UIButton buttonWithImageForNomal:[UIImage imageNamed:@"compose_toolbar_picture"] forHighLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(buttonClick:) title:nil];
    photoButton.tag = 11;
    
    [self addSubview:photoButton];
    
    //提及
    UIButton *toButton = [UIButton buttonWithImageForNomal:[UIImage imageNamed:@"compose_toolbar_picture"] forHighLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(buttonClick:) title:nil];

    
    toButton.tag = 12;
    
    [self addSubview:toButton];
    
    //话题
    UIButton *tiButton = [UIButton buttonWithImageForNomal:[UIImage imageNamed:@"compose_toolbar_picture"] forHighLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(buttonClick:) title:nil];
    
    tiButton.tag = 13;
    
    [self addSubview:tiButton];
    
    //表情
    UIButton *emojiButton = [UIButton buttonWithImageForNomal:[UIImage imageNamed:@"compose_toolbar_picture"] forHighLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(buttonClick:) title:nil];
    
    emojiButton.tag = 14;
    
    [self addSubview:emojiButton];
    
    //键盘
    UIButton *keyButton = [UIButton buttonWithImageForNomal:[UIImage imageNamed:@"compose_toolbar_picture"] forHighLight:[UIImage imageNamed:@"compose_toolbar_picture_highlighted"] target:self action:@selector(buttonClick:) title:nil];
    
    keyButton.tag = 15;
    
    [self addSubview:keyButton];
}

-(void)layoutSubviews
{
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        UIButton *button = self.subviews[i];
        
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = self.w/count;
        CGFloat h = self.h;
        x = w * i;
        
        button.frame = CGRectMake(x, y, w, h);
    }
    
}

-(void)buttonClick:(UIButton *)sender
{
    UIButton *button = sender;
    
    if ([_delegate respondsToSelector:@selector(DidClickTools:clickButton:)]) {
        [_delegate DidClickTools:self clickButton:button];
    }
    

}


@end
