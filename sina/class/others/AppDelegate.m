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




@end
