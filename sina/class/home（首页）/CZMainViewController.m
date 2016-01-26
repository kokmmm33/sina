//
//  CZMainViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CZMainViewController.h"

#import "UIBarButtonItem+CJBarButtonItem.h"
#import "UIView+view.h"

#import "CJTitleButton.h"
#import "CJCover.h"
#import "CJPopMenu.h"

@interface CZMainViewController ()<CJCoverDelegate>

@property(nonatomic,weak)UIButton *titleTN;

@end

@implementation CZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    [self setNavigationBar];
    
}

-(void)setNavigationBar
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highLightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] controller:self action:@selector(leftBTClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_pop"] highLightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] controller:self action:@selector(rightBTClick)];
    
    CJTitleButton *titleBT = [CJTitleButton buttonWithType:UIButtonTypeCustom];
    
    [titleBT setTitle:@"首页" forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    [titleBT addTarget: self action:@selector(titleBTNClick:) forControlEvents:UIControlEventTouchUpInside];
    
    titleBT.adjustsImageWhenHighlighted = NO;
    
    self.navigationItem.titleView = titleBT;
}

-(void)configureTitleButton
{


}

-(void)leftBTClick
{
    


}

-(void)rightBTClick
{

}

-(void)titleBTNClick:(UIButton *)bt
{
    bt.selected = !bt.selected;
    
    _titleTN = bt;
    
    CJCover *cover = [CJCover show];
    
    cover.delegate = self;
    
    CGFloat w = 200;
    CGFloat h = w ;
    CGFloat x = (self.view.w - w) * 0.5;
    CGFloat y = 55;
    CJPopMenu *memu = [CJPopMenu showInRect:CGRectMake(x, y, w, h)];
    
}

-(void)DidClickedCover:(CJCover *)cover
{
    _titleTN.selected = NO;
    
    [CJPopMenu hide];


}

@end
