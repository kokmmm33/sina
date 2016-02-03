//
//  CZMainViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJMainViewController.h"
#import "CJPopController.h"

#import "CJTitleButton.h"
#import "CJCover.h"
#import "CJPopMenu.h"

#import "CJStatus.h"
#import "CJUser.h"
#import "CJAcountTools.h"
#import "CJAccount.h"


#import "UIBarButtonItem+CJBarButtonItem.h"
#import "UIView+view.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "CJHTTPTools.h"
#import "CJStatusTools.h"



@interface CJMainViewController ()<CJCoverDelegate>

@property(nonatomic,weak)UIButton *titleTN;

@property(nonatomic,strong)NSMutableArray *statuses;

@end

@implementation CJMainViewController

-(NSMutableArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }

    return _statuses;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    // Do any additional setup after loading the view.

    [self setNavigationBar];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadData)];

    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    
    [self.tableView headerBeginRefreshing];

    
    
}
-(void)loadMoreData
{
    
    NSString *maxid = nil;
    
    if (self.statuses.count) {
        CJStatus *firstStatus = [self.statuses lastObject];
        
        long long maxID = [firstStatus.idstr longLongValue] - 1;
        
        maxid = [NSString stringWithFormat:@"%lld",maxID];
    }
    
    NSDictionary *keyValue = @{@"max_id":maxid};
    
    [CJStatusTools loadDataWithKeyValue:keyValue successBlock:^(NSArray *statuses) {
        [self.statuses addObjectsFromArray:statuses];
        
        [self.tableView reloadData];
    } failedBlock:^(NSError *error) {
         NSLog(@"%@",error);
    }];
   
    [self.tableView footerEndRefreshing];
    
    
}

-(void)loadData
{
    NSString *sinceID = @"0";
    
    if (self.statuses.count) {
        CJStatus *firstStatus = self.statuses[0];
        sinceID = firstStatus.idstr;
    }
    
    NSDictionary *keyValue = @{@"since_id":sinceID};

    [CJStatusTools loadDataWithKeyValue:keyValue successBlock:^(NSArray *statuses) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        
        [self.statuses insertObjects:statuses atIndexes:indexSet];
        
        [self.tableView reloadData];
    } failedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
   [self.tableView headerEndRefreshing];
}



-(void)setNavigationBar
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highLightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(leftBTClick) forControlEvent:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_pop"] highLightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(rightBTClick) forControlEvent:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = self.titleTN;
}

-(UIButton *)titleTN
{
    
    CJTitleButton *titleBT = [[CJTitleButton alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
    
    [titleBT setTitle:@"首页" forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    [titleBT addTarget: self action:@selector(titleBTNClick:) forControlEvents:UIControlEventTouchUpInside];

    
    return titleBT;

}

-(void)leftBTClick
{
    
    


}

-(void)rightBTClick
{
    CJPopController *popVC = [[CJPopController alloc]init];
    
    popVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:popVC animated:YES];
    
    

}

-(void)titleBTNClick:(UIButton *)bt
{
    bt.selected = !bt.selected;
    
    _titleTN = bt;
    
    CJCover *cover = [CJCover show];
    
    cover.delegate = self;
    
    CGFloat w = 200;
    CGFloat h = w ;
    CGFloat x = (self.view.w - w) * 0.5;
    CGFloat y = 55;
    CJPopMenu *memu = [CJPopMenu showInRect:CGRectMake(x, y, w, h)];
    
}

-(void)DidClickedCover:(CJCover *)cover
{
    _titleTN.selected = NO;
    
    [CJPopMenu hide];


}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    
    CJStatus *status = self.statuses[indexPath.row];

    cell.textLabel.text = status.text;
    
    return cell;

}
@end
