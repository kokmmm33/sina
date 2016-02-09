//
//  AppDelegate.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "AppDelegate.h"
#import "CJTabbarViewController.h"
#import "CJNewFutureController.h"
#import "CJOAuthController.h"

#import "CJAcountTools.h"
#import "CJAccount.h"
#import "SDWebImageManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //判断是否登陆有效账号
    
    CJAccount *account = [CJAcountTools acount];
    
    if (account)
    {
        CJTabbarViewController *tabBarController = [[CJTabbarViewController alloc]init];
        
        self.window.rootViewController = tabBarController;
    }else
    {
        CJOAuthController *vc = [[CJOAuthController alloc]init];
        
        self.window.rootViewController = vc;
    
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

//-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
//{
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    [manager cancelAll];
//    
//    SDImageCache *cache = [[SDImageCache alloc]init];
//    [cache clearMemory];
//
//}
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // 停止下载图片
    [[SDWebImageManager sharedManager] cancelAll];
    
    // 清除内存缓存图片
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}



@end
