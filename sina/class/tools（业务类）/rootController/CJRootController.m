//
//  CJRootController.m
//  sina
//
//  Created by Joseph on 16/2/1.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJRootController.h"
#import "CJTabbarViewController.h"
#import "CJNewFutureController.h"

@implementation CJRootController
+(void)chooseRootController
{
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"isFirst"]) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirst"];
        
        CJNewFutureController *newFuture = [[CJNewFutureController alloc]init];
        CZKeyWindow.rootViewController = newFuture;
    }else
    {
        CJTabbarViewController *tabBarController = [[CJTabbarViewController alloc]init];
        
        CZKeyWindow.rootViewController = tabBarController;
    }
}
@end
