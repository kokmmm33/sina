//
//  CJAcountTools.m
//  sina
//
//  Created by Joseph on 16/1/31.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJAcountTools.h"
#import "CJOAuthParameter.h"
#import "CJHTTPTools.h"
#import "MJExtension.h"
#import "CJRootController.h"

#define AccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation CJAcountTools
static CJAccount *_acount;

+(void)saveAcount:(CJAccount *)acount
{
    [NSKeyedArchiver archiveRootObject:acount toFile:AccountFileName];

}

/**
 *  类方法一般用静态变量代替成员属性
 *
 *  @return <#return value description#>
 */
+(CJAccount *)acount
{
    
    if (_acount == nil) {
        
        _acount = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFileName];
        
        if ([[NSDate date] compare:_acount.expires_date] == NSOrderedDescending ) {
            NSLog(@"============您的账号已过期");
        }
    }
    
    return _acount;
}

+(void)loadAcountWithCode:(NSString *)code
{
    /**
     parameters[@"client_id"] = @"3008994865";
     parameters[@"client_secret"] = @"679803b998bf148787e7a2ca53cf9b1e";
     parameters[@"grant_type"] = @"authorization_code";
     parameters[@"code"] = code;
     parameters[@"redirect_uri"] = @"https://github.com/";
     */
    CJOAuthParameter *parameter = [[CJOAuthParameter alloc]init];
    parameter.client_id = @"2188301667";
    parameter.client_secret = @"cd9a005d94e37c0480fb9dcdb2aacb76";
    parameter.grant_type = @"authorization_code";
    parameter.code = code;
    parameter.redirect_uri = @"https://github.com/";
    NSDictionary *dic = parameter.keyValues;

    [CJHTTPTools POST:@"https://api.weibo.com/oauth2/access_token" parameters:dic success:^(id responseObject) {
        CJAccount *account = [CJAccount accountWithDic:responseObject];
        
        [CJAcountTools saveAcount:account];

        [CJRootController chooseRootController];

    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
