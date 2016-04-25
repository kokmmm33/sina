//
//  CJStatusCell.m
//  sina
//
//  Created by Joseph on 16/2/3.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatusCell.h"
#import "CJOriginalStatusView.h"
#import "CJretweetedstatusView.h"
#import "CJStatusToolsView.h"

#import "CJStatusCellItem.h"

@interface CJStatusCell()
@property(nonatomic,weak)CJOriginalStatusView *originalView;
@property(nonatomic,weak)CJretweetedstatusView *retweetedView;
@property(nonatomic,weak)CJStatusToolsView *toolsView;
@end
@implementation CJStatusCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        CJOriginalStatusView *originalView = [[CJOriginalStatusView alloc]init];
        originalView.frame = self.StatusCellItem.originalViewFrame;
        _originalView = originalView;
        [self addSubview:originalView];
        
        CJretweetedstatusView *retweetView = [[CJretweetedstatusView alloc]init];
        _retweetedView = retweetView;
        [self addSubview:retweetView];
        
        CJStatusToolsView *toolsView = [[CJStatusToolsView alloc]init];
        _toolsView = toolsView;
        [self addSubview:toolsView];
    }
    return self;
}

-(void)setStatusCellItem:(CJStatusCellItem *)StatusCellItem
{
    _StatusCellItem = StatusCellItem;
    
    _originalView.StatusCellItem = StatusCellItem;
    _originalView.frame = StatusCellItem.originalViewFrame;
    
    
    _retweetedView.StatusCellItem = StatusCellItem;
    _retweetedView.frame = StatusCellItem.retweetViewFrame;
    
    _toolsView.frame = StatusCellItem.toolBarFrame;
    _toolsView.statusCellItem = StatusCellItem;

}






@end
