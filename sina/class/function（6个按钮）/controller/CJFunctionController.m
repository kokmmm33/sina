//
//  CJFunctionController.m
//  sina
//
//  Created by mac on 16/4/23.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJFunctionController.h"
#import "CJComposeViewController.h"

#import "CJFunctionVM.h"



@interface CJFunctionController ()


@property(nonatomic,strong)UIButton *backBT;

@property(nonatomic,strong)CJFunctionVM *viewInformation;

@end

@implementation CJFunctionController

-(CJFunctionVM *)viewInformation
{
    if (_viewInformation == nil) {
        _viewInformation = [[CJFunctionVM alloc]init];
    }
    return _viewInformation;

}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //返回按钮动画
//    self.backBT.alpha = 0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
//    self.backBT.alpha = 1;
    self.backBT.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    [UIView setAnimationDuration:0.35];
    [UIView commitAnimations];
    
    //6个按钮的动画
    for (int i = 0; i < self.viewInformation.buttons.count; i++) {
        
        //for循环里执行动画是把这个for 循环执行完毕后，在同一执行动画的。
        UIButton *button = [self.viewInformation.buttons objectAtIndex:i];
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.35];
//        [UIView setAnimationDelay:0.02*i];
//        [UIView setAnimationDelegate:self];
//        button.transform = CGAffineTransformMakeTranslation(0, -350);
//        [UIView commitAnimations];
        
        [UIView animateWithDuration:0.35 delay:0.03*i usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.transform = CGAffineTransformMakeTranslation(0, -400);
        } completion:^(BOOL finished) {
            
        }];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    UIImageView *BGImageView = [[UIImageView alloc]init];
    BGImageView.image = [UIImage imageNamed:@"compose_slogan"];
    BGImageView.center = CGPointMake(ScreenWidth * 0.25, 150);
    [BGImageView sizeToFit];
    [self.view addSubview:BGImageView];
    
    //添加按钮
    [self addButtons];

    //添加返回条
    [self addBackBar];

    
}

-(void)addButtons
{
    //将6个按钮添加到视图的最底部
    [self.viewInformation.buttons enumerateObjectsUsingBlock:^(UIButton* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *rect = [self.viewInformation.BTFrames objectAtIndex:idx];
        CGRect frame = CGRectFromString(rect);
        CGFloat x = frame.origin.x;
        CGFloat y = frame.origin.y + 365;
        obj.frame = CGRectMake(x, y, frame.size.width ,frame.size.height);
        obj.tag = idx + 10;
        [obj addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:obj];
    }];
}


-(void)addBackBar
{
    self.backBT = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backBT addTarget:self action:@selector(dismissVC:) forControlEvents:UIControlEventTouchUpInside];;
    self.backBT.backgroundColor = [UIColor whiteColor];
    self.backBT.frame = self.viewInformation.backBTFrame;
    [self.backBT setImage:[UIImage imageNamed:@"compose_button_back"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBT];

}

#pragma mark - 返回按钮动画
-(void)dismissVC:(UIButton *)button
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    self.backBT.imageView.transform = CGAffineTransformMakeRotation(0);
    self.backBT.alpha = 0;
    [UIView commitAnimations];
    
    // 反向遍历6个按钮，并动画
    for (int i = 5; i >= 0; i--) {
        UIButton *button = [self.viewInformation.buttons objectAtIndex:i];
        [UIView animateWithDuration:0.25 delay:0.03*(5-i) options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            if (finished == YES) {
                [self dismissViewControllerAnimated:NO completion:nil];
            }
        }];
    }
    
}
     
-(void)presentVC:(UIButton *)button
{
//    [self dismissViewControllerAnimated:NO completion:^{
// //       switch语句中若使用对象须用｛｝，对象只能在这个作用域生效。
//            switch (button.tag) {
//                case 10:
//                {
//                    CJComposeViewController *composeVC = [[CJComposeViewController alloc]init];
//                    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:composeVC];
//        
//                    [self presentViewController:navigationVC animated:YES completion:nil];
//                }
//                    break;
//                    
//                default:
//                    break;
//            }
//    }];
    
    //移除按钮
//    [self.viewInformation.buttons enumerateObjectsUsingBlock:^(UIButton* obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [button removeFromSuperview];
//    }];
//    

    
    CJComposeViewController *composeVC = [[CJComposeViewController alloc]init];
    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:composeVC];
    

    [self presentViewController:navigationVC animated:YES completion:nil];
    

}


@end
