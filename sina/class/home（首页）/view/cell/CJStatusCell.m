//
//  CJStatusCell.m
//  sina
//
//  Created by Joseph on 16/2/3.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatusCell.h"
#import "CJStatusToolsView.h"
#import "CJOriginalStatusView.h"
#import "CJretweetedstatusView.h"
#import "CJStatusCellItem.h"

@interface CJStatusCell()
@property(nonatomic,weak)CJOriginalStatusView *originalView;
@end
@implementation CJStatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setStatusCellItem:(CJStatusCellItem *)StatusCellItem
{
    _StatusCellItem = StatusCellItem;
    self.originalView.StatusCellItem = StatusCellItem;
    self.originalView.frame = StatusCellItem.originalRect;
    

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CJOriginalStatusView *originalView = [[CJOriginalStatusView alloc]init];
        originalView.frame = self.StatusCellItem.originalRect;
        _originalView = originalView;
        [self addSubview:originalView];
//        
//        CJretweetedstatusView *retweetView = [[CJretweetedstatusView alloc]init];
//        [self addSubview:retweetView];
//        
//        CJStatusToolsView *toolsView = [[CJStatusToolsView alloc]init];
//        [self addSubview:toolsView];
    }
    return self;
}


@end
