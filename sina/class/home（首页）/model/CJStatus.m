//
//  CJStatus.m
//  sina
//
//  Created by Joseph on 16/2/1.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatus.h"
#import "CJStatusImage.h"

#import "NSDate+MJ.h"

@implementation CJStatus
+ (NSDictionary *)objectClassInArra
{
    return @{@"pic_urls":[CJStatusImage class]};
}

-(NSString *)created_at
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *created_at = [fmt dateFromString:_created_at];

    if ([created_at isThisYear]) { // 今年
        
        if ([created_at isToday]) { // 今天
            
            // 计算跟当前时间差距
            NSDateComponents *cmp = [created_at deltaWithNow];
            
            if (cmp.hour < 1) {
                if (cmp.minute > 1){
                    return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];}
                return @"刚刚";
                
            }else{
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }
            
        }else if ([created_at isYesterday]){ // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:created_at];
            
        }else{ // 前天
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:created_at];
        }
        
        
        
    }else{ // 不是今年
        
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        
        return [fmt stringFromDate:created_at];
        
    }

    
//    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
//    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
//    NSDate *date = [fmt dateFromString:_created_at];
//
//    if ([date isThisYear]) {
//            //今年
//        if ([date isToday]) {
//            //今天
//            // 计算跟当前时间差距
//            NSDateComponents *cmp = [date deltaWithNow];
//            
//            if (cmp.hour >= 1) {
//                _created_at = [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
//            }else if (cmp.minute > 1){
//                _created_at = [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
//            }else{
//                return @"刚刚";
//            }
//            
//        }else{
//            if ([date isYesterday]) {
//                //昨天
//                fmt.dateFormat = @"昨天 HH:mm";
//                _created_at =  [fmt stringFromDate:date];
//            }else
//            {//几天前
//                fmt.dateFormat = @"MM-dd HH:mm";
//                _created_at =  [fmt stringFromDate:date];
//            
//            
//            }
//        }
//    }else
//    {
//        //一年前
//        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
//    
//        _created_at = [fmt stringFromDate:date];
//    
//    }
//    return _created_at;

}

- (void)setSource:(NSString *)source
{
    // abc>微 3 1
    //  微博 weibo.com</a>
    //  <a href="http://weibo.com/" rel="nofollow">微博 weibo.com</a>
    // 微博 weibo.com
    NSRange range = [source rangeOfString:@">"];
    source = [source substringFromIndex:range.location + range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    source = [NSString stringWithFormat:@"来自%@",source];
    
    _source = source;
}
@end







    