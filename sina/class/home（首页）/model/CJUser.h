//
//  CJUser.h
//  sina
//
//  Created by Joseph on 16/2/1.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJUser : NSObject
/**
 *  备注
 */
@property(nonatomic,copy)NSString *name;
/**
 *  头像
 */
@property(nonatomic,strong)NSURL *profile_image_url;
/**
 *  用户昵称
 */
@property(nonatomic,copy)NSString *screen_name;
@end
