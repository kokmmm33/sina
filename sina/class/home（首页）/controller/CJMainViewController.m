//
//  CZMainViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJMainViewController.h"
#import "CJPopController.h"

#import "UIBarButtonItem+CJBarButtonItem.h"
#import "UIView+view.h"

#import "CJTitleButton.h"
#import "CJCover.h"
#import "CJPopMenu.h"

@interface CJMainViewController ()<CJCoverDelegate>

@property(nonatomic,weak)UIButton *titleTN;

@end

@implementation CJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.
    
    [self setNavigationBar];
    
}

-(void)setNavigationBar
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highLightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(leftBTClick) forControlEvent:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_pop"] highLightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(rightBTClick) forControlEvent:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = self.titleTN;
}

-(UIButton *)titleTN
{
    
    CJTitleButton *titleBT = [[CJTitleButton alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    
    [titleBT setTitle:@"首页" forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    [titleBT addTarget: self action:@selector(titleBTNClick:) forControlEvents:UIControlEventTouchUpInside];

    
    return titleBT;

}

-(void)leftBTClick
{
    
    


}

-(void)rightBTClick
{
    CJPopController *popVC = [[CJPopController alloc]init];
    
    popVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:popVC animated:YES];
    
    

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
