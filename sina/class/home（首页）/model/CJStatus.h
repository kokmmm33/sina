//
//  CJStatus.h
//  sina
//
//  Created by Joseph on 16/2/1.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@class CJUser;
@interface CJStatus : NSObject<MJKeyValue>
/**
 *  微博创建时间
 */
@property(nonatomic,copy)NSString *created_at;
/**
 *  字符串型的微博ID
 */
@property(nonatomic,copy)NSString *idstr;
/**
 *  微博信息内容
 */
@property(nonatomic,copy)NSString *text;
/**
 *  微博来源
 */
@property(nonatomic,copy)NSString *source;
/**
 *  微博作者的用户信息字段
 */
@property(nonatomic,strong)CJUser *user;
/**
 *  被转发的原微博信息
 */
@property(nonatomic,strong)CJStatus *retweeted_status;
/**
 *  转发数
 */
@property(nonatomic,assign)int reposts_count;
/**
 *  评论数
 */
@property(nonatomic,assign)int comments_count;
/**
 *  表态数(赞)
 */
@property(nonatomic,assign)int attitudes_count;
/**
 *  微博配图
 */
@property(nonatomic,copy)NSArray *pic_urls;



@end
