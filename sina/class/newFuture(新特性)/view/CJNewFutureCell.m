//
//  CJNewFutureCell.m
//  sina
//
//  Created by Joseph on 16/1/28.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJNewFutureCell.h"
#import "CJTabbarViewController.h"

@interface CJNewFutureCell()

@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UIButton *shareButton;

@property(nonatomic,strong)UIButton *startButton;


@end

@implementation CJNewFutureCell

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        
        //一个对象必须有一个strong类型的指针接收
        
        _imageView = [[UIImageView alloc]init];
        
        _imageView.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_imageView];
    }
    
    return _imageView;
}

-(UIButton *)shareButton
{
    if (_shareButton == nil) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_shareButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        
        [_shareButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        
        [_shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
        
        [_shareButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        
        [_shareButton sizeToFit];
        
        [self addSubview:_shareButton];
    }
    return _shareButton;
}


-(UIButton *)startButton
{
    if (_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        
        [_startButton setTitle:@"开始微博" forState:UIControlStateNormal];
        
        [_startButton addTarget:self action:@selector(turnToTabBar) forControlEvents:UIControlEventTouchUpInside];
        
        [_startButton sizeToFit];
        
        [self addSubview:_startButton];
    }
    return _startButton;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    self.shareButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.7);
    
    self.startButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.8);
    

}

-(void)setUpCell:(NSIndexPath *)indexPath CellImage:(UIImage *)image imageCount:(NSInteger)count
{
    self.imageView.image = image;
    
    if (indexPath.row == count - 1) {
        
        self.shareButton.hidden = NO;
        self.startButton.hidden = NO;
        
    }else{ // 非最后一页，隐藏分享和开始按钮
        self.shareButton.hidden = YES;
        self.startButton.hidden = YES;
    }
}

-(void)turnToTabBar
{
    
    CJTabbarViewController *tabBarController = [[CJTabbarViewController alloc]init];
    
    CZKeyWindow.rootViewController = tabBarController;

}




@end
