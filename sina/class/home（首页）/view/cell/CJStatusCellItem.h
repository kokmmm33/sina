//
//  CJStatusCellItem.h
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CJStatus;

@interface CJStatusCellItem : NSObject

@property(nonatomic,strong)CJStatus *status;

@property(nonatomic,assign)CGRect originalRect;

@property(nonatomic,assign)CGRect originaIconRect;

@property(nonatomic,assign)CGRect originaNameRect;

@property(nonatomic,assign)CGRect originalVipRect;

@property(nonatomic,assign)CGRect originalTimeRect;

@property(nonatomic,assign)CGRect originalSourceRect;

@property(nonatomic,assign)CGRect originalTextRect;

@property(nonatomic,assign)CGRect retweetedRect;

@property(nonatomic,assign)CGRect retweetedNameRect;

@property(nonatomic,assign)CGRect retweetedTextRect;

@property(nonatomic,assign)CGRect toolsRect;





@end
