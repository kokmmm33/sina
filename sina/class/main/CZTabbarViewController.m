//
//  CZTabbarViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CZTabbarViewController.h"

#import "CZProFileViewController.h"
#import "CZMessageViewController.h"
#import "CZMainViewController.h"
#import "CZDiscoverViewController.h"

#import "UIImage+CZRenderImage.h"

#import "CZTabbar.h"
#import <objc/message.h>

@interface CZTabbarViewController ()

@end

@implementation CZTabbarViewController


+(void)initialize
{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:attributes forState:UIControlStateSelected];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CZTabbar *tabbar = [[CZTabbar alloc]initWithFrame:self.tabBar.frame];
    //[self setValue:tabbar forKeyPath:@"tabBar"];
    objc_msgSend(self, @selector(setTabBar:),tabbar);
    
    NSLog(@"%@",self.tabBar);
    
    [self setAllChildViewController];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"===%@",self.tabBar.subviews);

}

-(void)setAllChildViewController
{
    CZMainViewController *main = [[CZMainViewController alloc]init];
    [self setOneChildViewController:main image:[UIImage imageNamed:@"tabbar_home"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_home_selected"] title:@"首页"];
    
    CZMessageViewController *message = [[CZMessageViewController alloc]init];
    [self setOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_message_center_selected"] title:@"消息"];
     
     
     
    CZDiscoverViewController *discover = [[CZDiscoverViewController alloc]init];
    [self setOneChildViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_discover_selected"] title:@"发现"];
    
    CZProFileViewController *profile = [[CZProFileViewController alloc]init];
    [self setOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectImage:[UIImage imageWithOriginalImage:@"tabbar_profile_selected"] title:@"我"];

}


- (void)setOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;

    
    [self addChildViewController:vc];


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
