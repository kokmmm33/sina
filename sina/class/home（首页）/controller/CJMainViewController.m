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
#import "CJStatusCell.h"

#import "CJStatus.h"
#import "CJUser.h"
#import "CJAcountTools.h"
#import "CJAccount.h"
#import "CJStatusParameter.h"
#import "CJStatusCellItem.h"


#import "UIBarButtonItem+CJBarButtonItem.h"
#import "UIView+view.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "CJHTTPTools.h"
#import "CJStatusTools.h"
#import "UIImageView+WebCache.h"
#import "UIImage+CZRenderImage.h"
#import "CJUserTools.h"
#import "SDWebImageManager.h"


@interface CJMainViewController ()<CJCoverDelegate>

@property(nonatomic,weak)UIButton *titleTN;

@property(nonatomic,strong)NSMutableArray *statusItems;

@end

@implementation CJMainViewController

-(NSMutableArray *)statusItems
{
    if (_statusItems == nil) {
        
        _statusItems = [NSMutableArray array];
        
    }

    return _statusItems;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:220 green:220 blue:220 alpha:0.99];
    // Do any additional setup after loading the view.

    [self setNavigationBar];
//    
//    [self.tableView registerClass:[CJStatusCell class] forCellReuseIdentifier:@"ID"];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadData)];

    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    
    [self.tableView headerBeginRefreshing];

    
    
}
-(void)loadMoreData
{
    
    NSString *maxid = nil;
    
    if (self.statusItems.count) {
        CJStatusCellItem *item = [self.statusItems lastObject];
        
        long long maxID = [item.status.idstr longLongValue] - 1;
        
        maxid = [NSString stringWithFormat:@"%lld",maxID];
    }
    
    CJStatusParameter *parameter = [[CJStatusParameter alloc]init];
    parameter.access_token = [CJAcountTools acount].access_token;
    parameter.max_id = maxid;
    
    [CJStatusTools loadDataWithParameter:parameter successBlock:^(NSArray *statuses) {
        NSMutableArray *itemArr = [NSMutableArray array];
        for (CJStatus *status in statuses) {
            CJStatusCellItem *item = [[CJStatusCellItem alloc]init];
            item.status = status;
            [itemArr addObject:item];
        }
        
        [self.statusItems addObjectsFromArray:itemArr];
        
        [self.tableView reloadData];
    } failedBlock:^(NSError *error) {
         NSLog(@"%@",error);
    }];
   
    [self.tableView footerEndRefreshing];
    
    
}

-(void)loadData
{
    NSString *sinceID = @"0";
    
    if (self.statusItems.count) {
        CJStatusCellItem *item = self.statusItems[0];
        sinceID = item.status.idstr;
    }
    
    CJStatusParameter *parameter = [[CJStatusParameter alloc]init];
    parameter.access_token = [CJAcountTools acount].access_token;
    parameter.since_id = sinceID;
    
    [CJStatusTools loadDataWithParameter:parameter successBlock:^(NSArray *statuses) {
        
        NSMutableArray *itemArr = [NSMutableArray array];
        for (CJStatus *status in statuses) {
            
            CJStatusCellItem *item = [[CJStatusCellItem alloc]init];
            
            item.status = status;
            
            [itemArr addObject:item];
        }
         NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statusItems insertObjects:itemArr atIndexes:indexSet];
        [self.tableView reloadData];
        
    } failedBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
   [self.tableView headerEndRefreshing];
}



-(void)setNavigationBar
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highLightImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(leftBTClick) forControlEvent:UIControlEventTouchUpInside title:nil];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"navigationbar_pop"] highLightImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(rightBTClick) forControlEvent:UIControlEventTouchUpInside title:nil];
    
    self.navigationItem.titleView = self.titleTN;
}

-(UIButton *)titleTN
{
    
    CJTitleButton *titleBT = [[CJTitleButton alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];

    CJAccount *account = [CJAcountTools acount];
    
    [CJUserTools getUserInfoWithAccess_token:account.access_token uid:account.uid screenName:nil sucessBlock:^(CJUser *user) {
        [titleBT setTitle:user.screen_name forState:UIControlStateNormal];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

    [titleBT addTarget: self action:@selector(titleBTNClick:) forControlEvents:UIControlEventTouchUpInside];
//    [titleBT setBackgroundImage:[UIImage imageWithStrectchable:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
//    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
//    
//    [titleBT setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    

    
    
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

#pragma mark - dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusItems.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ID";
    CJStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[CJStatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    CJStatusCellItem *item = self.statusItems[indexPath.row];

    cell.StatusCellItem = item;


    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJStatusCellItem *item = self.statusItems[indexPath.row];
    return item.cellHeight;

}


-(void)didReceiveMemoryWarning
{
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    
    [mgr cancelAll];
    
    [mgr.imageCache clearMemory];

}
@end
