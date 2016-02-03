//
//  CJStatusTools.h
//  sina
//
//  Created by Joseph on 16/2/2.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJStatusTools : NSObject
//+(void)loadDataWithSinceID:(NSString *)sinceID successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;
//
//+(void)loadMoreDataWithSinceID:(NSString *)maxID successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;

+(void)loadDataWithKeyValue:(NSDictionary *)KeyValue successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;
@end
