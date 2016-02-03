//
//  CJStatusTools.m
//  sina
//
//  Created by Joseph on 16/2/2.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatusTools.h"
#import "CJHTTPTools.h"
#import "CJAcountTools.h"
#import "CJStatus.h"

@implementation CJStatusTools
//
//+(void)loadDataWithSinceID:(NSString *)sinceID successBlock:(void (^)(NSArray *))successBlock failedBlock:(void (^)(NSError *error))failedBlock
//{
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//
//        
//    parameters[@"since_id"] = sinceID;
//
//    parameters[@"access_token"] = [CJAcountTools acount].access_token;
//    
//    [CJHTTPTools GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameters success:^(id responseObject) {
//        NSLog(@"**********%@",responseObject);
//        
//        NSArray *dic = responseObject[@"statuses"];
//        
//        NSArray *arr = (NSMutableArray *)[CJStatus objectArrayWithKeyValuesArray:dic];
//        successBlock(arr);
//
//    } failure:^(NSError *error) {
//        failedBlock(error);
//    }];
//}
//
//+(void)loadMoreDataWithSinceID:(NSString *)maxID successBlock:(void (^)(NSArray *))successBlock failedBlock:(void (^)(NSError *))failedBlock
//{
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    
//    
//    parameters[@"max_id"] = maxID;
//    
//    parameters[@"access_token"] = [CJAcountTools acount].access_token;
//    
//    [CJHTTPTools GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameters success:^(id responseObject) {
//        NSLog(@"**********%@",responseObject);
//        
//        NSArray *dic = responseObject[@"statuses"];
//        
//        NSArray *arr = (NSMutableArray *)[CJStatus objectArrayWithKeyValuesArray:dic];
//        successBlock(arr);
//        
//    } failure:^(NSError *error) {
//        failedBlock(error);
//    }];
//}

+(void)loadDataWithKeyValue:(NSDictionary *)KeyValue successBlock:(void (^)(NSArray *))successBlock failedBlock:(void (^)(NSError *))failedBlock
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:KeyValue];
    
    parameters[@"access_token"] = [CJAcountTools acount].access_token;
    
    [CJHTTPTools GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:parameters success:^(id responseObject) {
        NSLog(@"**********%@",responseObject);
        
        NSArray *dic = responseObject[@"statuses"];
        
        NSArray *arr = (NSMutableArray *)[CJStatus objectArrayWithKeyValuesArray:dic];
        successBlock(arr);
        
    } failure:^(NSError *error) {
        failedBlock(error);
    }];


}
@end
