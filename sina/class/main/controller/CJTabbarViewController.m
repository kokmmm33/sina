//
//  CZTabbarViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJTabbarViewController.h"
#import "CJComposeViewController.h"
#import "CJProFileViewController.h"
#import "CJMessageViewController.h"
#import "CJMainViewController.h"
#import "CJDiscoverViewController.h"

#import "UIImage+CZRenderImage.h"

#import "CJNavigationController.h"
#import "CJTabBar.h"
#import <objc/message.h>

@interface CJTabbarViewController ()<CJCJTabBarDelegate>

@property(nonatomic,strong)NSMutableArray *items;

@end

@implementation CJTabbarViewController

-(NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
        
    }
    return _items;
}


//+(void)initialize
//{
//    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    
//    [item setTitleTextAttributes:attributes forState:UIControlStateSelected];
//
//}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setAllChildViewController];
    
//  NSLog(@"self.childViewControllers.count=%lu",(unsigned long)self.childViewControllers.count);
    
    CJTabBar *tabbar = [[CJTabBar alloc]initWithFrame:self.tabBar.bounds];
    
    tabbar.backgroundColor = [UIColor whiteColor];
    
    tabbar.items = self.items;
    
    tabbar.delegate = self;

    //[self setValue:tabbar forKeyPath:@"tabBar"];
    //    objc_msgSend(self, @selector(setTabBar:),tabbar);
    [self.tabBar addSubview:tabbar];
 //   NSLog(@"self.tabBar.subviews=%@",NSStringFromCGRect(self.tabBar.frame));

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *tabBarBT in self.tabBar.subviews) {
        if ([tabBarBT isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarBT removeFromSuperview];
        }
    }

}


-(void)setAllChildViewController
{
    CJMainViewController *main = [[CJMainViewController alloc]init];
    [self setOneChildViewController:main image:[UIImage imageNamed:@"tabbar_home"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_home_selected"] title:@"首页"];
    
    CJMessageViewController *message = [[CJMessageViewController alloc]init];
    [self setOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_message_center_selected"] title:@"消息"];
    
    CJDiscoverViewController *discover = [[CJDiscoverViewController alloc]init];
    [self setOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_discover_selected"] title:@"发现"];
    
    CJProFileViewController *profile = [[CJProFileViewController alloc]init];
    [self setOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_profile_selected"] title:@"我"];

}


- (void)setOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    
    CJNavigationController *nav = [[CJNavigationController alloc]initWithRootViewController:vc];
    
    [self.items addObject:vc.tabBarItem];
    
    [self addChildViewController:nav];
}

#pragma mark - ---tabBarDelegate-----

-(void)tabBar:(CJTabBar *)tabBar didClickBarButton:(NSInteger)index
{
//    NSLog(@"%s",__func__);
    self.selectedIndex = index;
}

-(void)tabBar:(CJTabBar *)tabBar didClickPlusButton:(UIButton *)plusButton
{
    CJComposeViewController *composeVC = [[CJComposeViewController alloc]init];
    
    UINavigationController *navigationVC = [[UINavigationController alloc]initWithRootViewController:composeVC];
    [self presentViewController:navigationVC animated:YES completion:nil];


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
