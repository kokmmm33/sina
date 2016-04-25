//
//  CJStatusToolsView.m
//  sina
//
//  Created by Joseph on 16/2/6.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatusToolsView.h"
#import "UIImage+CZRenderImage.h"

#import "CJStatusCellItem.h"
#import "CJStatus.h"

#define BUTTON_MARGIN  10

@interface CJStatusToolsView()

@property(nonatomic,weak)UIButton *retweetBT;
@property(nonatomic,weak)UIButton *commentBT;
@property(nonatomic,weak)UIButton *attitudtBT;

@property(nonatomic,strong)NSMutableArray *btARR;
@property(nonatomic,strong)NSMutableArray *imageViews;

@end


@implementation CJStatusToolsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableArray *)imageViews
{
    if (_imageViews == nil) {
        NSMutableArray *array = [NSMutableArray array];
        _imageViews = array;
    }
    return _imageViews;
}

-(NSMutableArray *)btARR
{
    if (_btARR == nil) {
        NSMutableArray *array = [NSMutableArray array];
        _btARR = array;
    }
    return _btARR;

}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStrectchable:@"timeline_card_top_background"];
        [self addThreeButton];
        
        
        for (int i = 0; i < 2; i ++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.image = [UIImage imageNamed:@"timeline_card_bottom_line"];
            [imageView sizeToFit];
            [self addSubview:imageView];
            
            [self.imageViews addObject:imageView];
        }
        
        
    
    }
    return self;
}

-(void)setStatusCellItem:(CJStatusCellItem *)statusCellItem
{
    _statusCellItem = statusCellItem;
    
//    statusCellItem.status.reposts_count = 9000;

    [self setButtonTitle:_retweetBT count:statusCellItem.status.reposts_count];
    
    [self setButtonTitle:_commentBT count:statusCellItem.status.comments_count];
    
    [self setButtonTitle:_attitudtBT count:statusCellItem.status.attitudes_count];
}


-(void)setButtonTitle:(UIButton *)button count:(int)count
{
    if (count > 0) {
        if (count >= 10000) {
            CGFloat newCount = count / 10000.0;
            
            NSString *title = [NSString stringWithFormat:@"%.1f万+",newCount];
            
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
            
            [button setTitle:title forState:UIControlStateNormal];
            
        }else
        {
            [button setTitle:[NSString stringWithFormat:@"%d",count]  forState:UIControlStateNormal];
        }
    }else
        return;
}
-(void)addThreeButton
{
    UIButton *retweetBT = [self buttonWithImageName:@"timeline_icon_retweet" highImageName:nil title:@"转发"];
    _retweetBT = retweetBT;
    
    UIButton *commentBT = [self buttonWithImageName:@"timeline_icon_comment" highImageName:nil title:@"评论"];
    _commentBT = commentBT;
    
    UIButton *attitudtBT = [self buttonWithImageName:@"timeline_icon_unlike" highImageName:nil title:@"赞"];
    _attitudtBT = attitudtBT;
    

}

-(UIButton *)buttonWithImageName:(NSString *)image highImageName:(NSString *)hightImage title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = FONT_15;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self addSubview:button];
    
    [self.btARR addObject:button];
    
    return button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < 3; i ++) {
        
        CGFloat w = ScreenWidth / self.btARR.count;
        CGFloat h = 25;
        CGFloat x = w * i;
        CGFloat y = self.h - h;
        
        UIButton *button = self.btARR[i];
        button.frame = CGRectMake(x, y, w, h);
    }
    
    int i = 1;
    
    for (UIImageView *divide in self.imageViews) {
        UIButton *btn = self.btARR[i];
        divide.x = btn.x;
        i++;
    }
//    int i = 1;
//    for (UIImageView *imageView in self.imageViews) {
//        UIButton *bt = self.btARR[i];
//        imageView.x = bt.x;
//        i++;
//    }
}






@end
