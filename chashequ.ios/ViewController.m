//
//  ViewController.m
//  chashequ.ios
//
//  Created by bevin chen on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ViewController.h"
#import "NewsCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btnTab1;
@synthesize btnTab2;
@synthesize btnTab3;
@synthesize btnTab4;
@synthesize btnTab5;
@synthesize pageControlView;
@synthesize currentTabBtn;
@synthesize tabScrollView;
@synthesize refreshTableView2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *tabImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    [tabImageView setImage:[UIImage imageNamed:@"tab_bg.png"]];
    [self.view addSubview:tabImageView];
    [self.view addSubview:self.pageControlView];
    
    // 创建TabButton
    [self.view addSubview:self.btnTab1];
    self.currentTabBtn = self.btnTab1;
    [self.view addSubview:self.btnTab2];
    [self.view addSubview:self.btnTab3];
    [self.view addSubview:self.btnTab4];
    [self.view addSubview:self.btnTab5];
    
    // ScrollView显示
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [testBtn setFrame:CGRectMake(300, 300, 20, 20)];
    [testBtn addTarget:self action:@selector(goToContent:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabScrollView addSubview:testBtn];
    
    self.refreshTableView2.delegate = self;
    self.refreshTableView2.dataSource = self;
    [self.tabScrollView addSubview:self.refreshTableView2];
    
    [self.tabScrollView setDelegate:self];
    [self.view addSubview:self.tabScrollView];
    
    // 开始加载数据
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
//    if ([self.requestDataType isEqualToString:@"category"]) {
//        [params setObject:@"goods_getListByCatId" forKey:@"act"];
//        [params setObject:self.requestId forKey:@"catId"];
//    } else if ([self.requestDataType isEqualToString:@"goodsIds"]) {
//        [params setObject:@"goods_getListById" forKey:@"act"];
//        [params setObject:self.requestId forKey:@"goodsId"];
//    } else if ([self.requestDataType isEqualToString:@"hotAdList"]) {
//        [params setObject:@"goods_getHotList" forKey:@"act"];
//    } else if ([self.requestDataType isEqualToString:@"newAdList"]) {
//        [params setObject:@"goods_getNewList" forKey:@"act"];
//    } else if ([self.requestDataType isEqualToString:@"search"]) {
//        [params setObject:@"goods_getListByKeywords" forKey:@"act"];
//        [params setObject:self.requestId forKey:@"keywords"];
//    }
//    MKNetworkOperation* op = [YMGlobal getOperation:params];
//    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        SBJsonParser *parser = [[SBJsonParser alloc]init];
//        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
//        if ([[object objectForKey:@"errorMessage"] isEqualToString:@"success"]) {
//            for (id o in [object objectForKey:@"data"]) {
//                GoodsModel *goodsModel = [[GoodsModel alloc]init];
//                goodsModel.goodsId = [o objectForKey:@"goodsId"];
//                goodsModel.goodsName = [o objectForKey:@"goodsName"];
//                goodsModel.goodsPrice = [o objectForKey:@"goodsPrice"];
//                goodsModel.imageUrl = [o objectForKey:@"imageUrl"];
//                [self.goodsList addObject:goodsModel];
//            }
//        }
//        if ([self.requestDataType isEqualToString:@"category"]) {
//            [self.refreshTableView reloadData:YES];
//        } else {
//            [self.refreshTableView reloadData:NO];
//        }
//        [HUD hide:YES];
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        NSLog(@"Error:%@", error);
//        [HUD hide:YES];
//    }];
//    [ApplicationDelegate.appEngine enqueueOperation: op];
}

// ScrollViewDidScroll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        int offset = (int)scrollView.contentOffset.x;
        int page = (int)(offset/320) + 1;
        //动画开始
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        self.pageControlView.frame = CGRectMake((page-1) * 64, 42, 64, 3);
        [UIView commitAnimations];

        [self.currentTabBtn setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
        switch (page) {
            case 1:
                [self.btnTab1 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
                self.currentTabBtn = self.btnTab1;
                break;
            case 2:
                [self.btnTab2 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
                self.currentTabBtn = self.btnTab2;
                break;
            case 3:
                [self.btnTab3 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
                self.currentTabBtn = self.btnTab3;
                break;
            case 4:
                [self.btnTab4 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
                self.currentTabBtn = self.btnTab4;
                break;
            case 5:
                [self.btnTab5 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
                self.currentTabBtn = self.btnTab5;
                break;
        }
    }
}

// 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NewsCell";
    NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell.contentView addSubview:cell.newsTitleLabel];
    cell.newsTitleLabel.text = @"testtestwttt";
//    [YMGlobal loadImage:goodsModel.imageUrl andImageView:cell.goodsImageView];
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

// 分类切换操作
- (void)changeType:(id)sender
{
    UIButton *typeBtn = sender;
    
    // 设置tabButton的文字颜色
    [self.currentTabBtn setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
    [typeBtn setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
    self.currentTabBtn = typeBtn;
    
    //动画开始
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.pageControlView.frame = CGRectMake((typeBtn.tag-1) * 64, 42, 64, 3);
    [self.tabScrollView setContentOffset:CGPointMake(320 * (typeBtn.tag-1), 0)];
    [UIView commitAnimations];
    
    NSLog(@"tag.id:%d", typeBtn.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBtnTab1:nil];
    [self setBtnTab2:nil];
    [self setBtnTab3:nil];
    [self setBtnTab4:nil];
    [self setBtnTab5:nil];
    [self setPageControlView:nil];
    [self setCurrentTabBtn:nil];
    [self setTabScrollView:nil];
    [self setRefreshTableView2:nil];
    [super viewDidUnload];
}
- (void)goToContent:(id)sender
{
    ZixunContentViewController *zixunContentView = [[ZixunContentViewController alloc]init];
    zixunContentView.zixunId = @"1";
    [self.navigationController pushViewController:zixunContentView animated:YES];
}

// 初始化操作
- (UIButton *)btnTab1
{
    if (btnTab1 == nil) {
        btnTab1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 42)];
        [btnTab1 setTag:1];
        [btnTab1 setTitle:@"头条" forState:UIControlStateNormal];
        [btnTab1.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [btnTab1 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnTab1 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [btnTab1 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnTab1;
}
- (UIButton *)btnTab2
{
    if (btnTab2 == nil) {
        btnTab2 = [[UIButton alloc]initWithFrame:CGRectMake(64, 0, 64, 42)];
        [btnTab2 setTag:2];
        [btnTab2 setTitle:@"资讯" forState:UIControlStateNormal];
        [btnTab2.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [btnTab2 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnTab2 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [btnTab2 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnTab2;
}
- (UIButton *)btnTab3
{
    if (btnTab3 == nil) {
        btnTab3 = [[UIButton alloc]initWithFrame:CGRectMake(128, 0, 64, 42)];
        [btnTab3 setTag:3];
        [btnTab3 setTitle:@"经营" forState:UIControlStateNormal];
        [btnTab3.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [btnTab3 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnTab3 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [btnTab3 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnTab3;
}
- (UIButton *)btnTab4
{
    if (btnTab4 == nil) {
        btnTab4 = [[UIButton alloc]initWithFrame:CGRectMake(192, 0, 64, 42)];
        [btnTab4 setTag:4];
        [btnTab4 setTitle:@"茶百科" forState:UIControlStateNormal];
        [btnTab4.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [btnTab4 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnTab4 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [btnTab4 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnTab4;
}
- (UIButton *)btnTab5
{
    if (btnTab5 == nil) {
        btnTab5 = [[UIButton alloc]initWithFrame:CGRectMake(256, 0, 64, 42)];
        [btnTab5 setTag:5];
        [btnTab5 setTitle:@"数据" forState:UIControlStateNormal];
        [btnTab5.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [btnTab5 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
        [btnTab5 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
        [btnTab5 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return btnTab5;
}
- (UIImageView *)pageControlView
{
    if (pageControlView == nil) {
        pageControlView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 42, 64, 3)];
        [pageControlView setImage:[UIImage imageNamed:@"page_control.png"]];
    }
    return pageControlView;
}
- (UIButton *)currentTabBtn
{
    if (currentTabBtn == nil) {
        currentTabBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 42)];
    }
    return currentTabBtn;
}
- (UIScrollView *)tabScrollView
{
    if (tabScrollView == nil) {
        tabScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 46, 320, 434)];
        tabScrollView.contentSize = CGSizeMake(1600, 434);
        tabScrollView.pagingEnabled = YES;
        tabScrollView.scrollEnabled = YES;
        tabScrollView.tag = 1;
    }
    return tabScrollView;
}
- (PullToRefreshTableView *)refreshTableView2
{
    if (refreshTableView2 == nil) {
        refreshTableView2 = [[PullToRefreshTableView alloc]initWithFrame:CGRectMake(320, 0, 320, 414)];
        [refreshTableView2 setRowHeight:94.0];
        [refreshTableView2 setBackgroundColor:[UIColor redColor]];
        refreshTableView2.tag = 2;
    }
    return refreshTableView2;
}
@end
