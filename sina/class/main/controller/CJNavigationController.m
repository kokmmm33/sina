//
//  CJNavigationController.m
//  sina
//
//  Created by Joseph on 16/1/20.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJNavigationController.h"
#import "CJTabBar.h"

#import "UIBarButtonItem+CJBarButtonItem.h"



@interface CJNavigationController ()<UINavigationControllerDelegate>

@property(nonatomic,strong) id popDelegate;

@end

@implementation CJNavigationController

+(void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    [item setTintColor:[UIColor orangeColor]];

}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    
    if (self.childViewControllers.count)
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_back"] highLightImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backButtonClick) forControlEvent:UIControlEventTouchUpInside];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_more"] highLightImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(moreButtonClick) forControlEvent:UIControlEventTouchUpInside];
    }
    
    [super pushViewController:viewController animated:animated];

}

-(void)backButtonClick
{
    [self popViewControllerAnimated:YES];
    
    
}

-(void)moreButtonClick
{
    [self popToRootViewControllerAnimated:YES];
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated

{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else
    {
        self.interactivePopGestureRecognizer.delegate = nil;
    }


}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
