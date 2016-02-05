//
//  CJStatusTools.h
//  sina
//
//  Created by Joseph on 16/2/2.
//  Copyright © 2016年 运来. All rights reserved.
//对微博模型的管控

#import <Foundation/Foundation.h>
@class CJStatusParameter;

@interface CJStatusTools : NSObject
//+(void)loadDataWithSinceID:(NSString *)sinceID successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;
//
//+(void)loadMoreDataWithSinceID:(NSString *)maxID successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;

+(void)loadDataWithParameter:(CJStatusParameter *)parameter successBlock:(void(^)(NSArray *statuses))successBlock failedBlock:(void(^)(NSError *error))failedBlock;
@end
