//
//  CJUserTools.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJUserTools.h"
#import "CJHTTPTools.h"
#import "CJBaseParameter.h"
#import "CJAcountTools.h"
#import "CJAccount.h"
#import "MJExtension.h"
@implementation CJUserTools

+(void)getUserInfoWithAccess_token:(NSString *)token uid:(NSString *)uid screenName:(NSString *)screenName sucessBlock:(void (^)(CJUser *))block failure:(void(^)(NSError *error))failure
{
   
    CJBaseParameter *param = [[CJBaseParameter alloc]init];
    param.access_token = token;
    param.uid = uid;
    NSDictionary *dic = param.keyValues;
    
    [CJHTTPTools GET:@"https://api.weibo.com/2/users/show.json" parameters:dic success:^(id responseObject) {
        if (responseObject) {
            CJUser *user = [CJUser objectWithKeyValues:responseObject];
            NSLog(@"-=-=---%@",user);
            block(user);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];

}

+(CJUser *)CurrentAccountUser
{
     __block CJUser *Auser = nil;
    CJAccount *account = [CJAcountTools acount];
    
    [self getUserInfoWithAccess_token:account.access_token uid:account.uid screenName:nil sucessBlock:^(CJUser *user) {
        Auser = user;
        NSLog(@"-=-=---%@",user);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    NSLog(@"-=-=%@",Auser);
    return Auser;
}

@end
