//
//  ViewController.m
//  chashequ.ios
//
//  Created by bevin chen on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ViewController.h"
#import "NewsCell.h"
#import "MBProgressHUD.h"

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
@synthesize refreshTableView1;
@synthesize refreshTableView2;
@synthesize refreshTableView3;
@synthesize refreshTableView4;
@synthesize refreshTableView5;
@synthesize tab1Array;
@synthesize tab2Array;
@synthesize tab3Array;
@synthesize tab4Array;
@synthesize tab5Array;
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
    [self.tabScrollView addSubview:self.refreshTableView1];
    [self.tabScrollView addSubview:self.refreshTableView2];
    [self.tabScrollView addSubview:self.refreshTableView3];
    [self.tabScrollView addSubview:self.refreshTableView4];
    [self.tabScrollView addSubview:self.refreshTableView5];
    [self.tabScrollView setDelegate:self];
    [self.view addSubview:self.tabScrollView];
    
    // 开始加载资讯id=52
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getListByType",@"method",@"52",@"type", nil];
    MKNetworkOperation *op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //NSLog(@"list%@",[completedOperation responseString]);
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
        if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"]) {
            tab2Array = [object objectForKey:@"data"];
            if ([tab2Array count] < 10) {
                [refreshTableView2 reloadData:NO];
            } else {
                [refreshTableView2 reloadData:YES];
            }
        }
        [HUD hide:YES];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
        [HUD hide:YES];
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
    // 经营id=53
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getListByType",@"method",@"53",@"type", nil];
    op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //NSLog(@"list%@",[completedOperation responseString]);
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
        if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"]) {
            tab3Array = [object objectForKey:@"data"];
            if ([tab3Array count] < 10) {
                [refreshTableView3 reloadData:NO];
            } else {
                [refreshTableView3 reloadData:YES];
            }
        }
        [HUD hide:YES];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
        [HUD hide:YES];
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
    // 茶百科id16
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getListByType",@"method",@"16",@"type", nil];
    op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //NSLog(@"list%@",[completedOperation responseString]);
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
        if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"]) {
            tab4Array = [object objectForKey:@"data"];
            if ([tab4Array count] < 10) {
                [refreshTableView4 reloadData:NO];
            } else {
                [refreshTableView4 reloadData:YES];
            }
        }
        [HUD hide:YES];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
        [HUD hide:YES];
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
    // 数据id=54
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getListByType",@"method",@"54",@"type", nil];
    op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //NSLog(@"list%@",[completedOperation responseString]);
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
        if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"]) {
            tab5Array = [object objectForKey:@"data"];
            if ([tab5Array count] < 10) {
                [refreshTableView5 reloadData:NO];
            } else {
                [refreshTableView5 reloadData:YES];
            }
        }
        [HUD hide:YES];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
        [HUD hide:YES];
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
}

// ScrollViewDidScroll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 100) {
        int offset = (int)scrollView.contentOffset.x;
        int page = (int)(offset/320) + 1;
        if (offset%320 > 160) {
            page = page+1;
        }
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
    if (scrollView.tag == 2) {
        [self.refreshTableView2 tableViewDidDragging];
    } else if(scrollView.tag == 3) {
        [self.refreshTableView3 tableViewDidDragging];
    } else if(scrollView.tag == 4) {
        [self.refreshTableView4 tableViewDidDragging];
    } else if(scrollView.tag == 5) {
        [self.refreshTableView5 tableViewDidDragging];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    int state = 0;
    int countPage = 0;
    NSString *requestType = @"";
    if (scrollView.tag == 2) {
        state = [self.refreshTableView2 tableViewDidEndDragging];
        countPage = (int)ceil([tab2Array count]/10);
        requestType = @"52";
    } else if (scrollView.tag == 3) {
        state = [self.refreshTableView3 tableViewDidEndDragging];
        countPage = (int)ceil([tab3Array count]/10);
        requestType = @"53";
    } else if (scrollView.tag == 4) {
        state = [self.refreshTableView4 tableViewDidEndDragging];
        countPage = (int)ceil([tab4Array count]/10);
        requestType = @"16";
    } else if (scrollView.tag == 5) {
        state = [self.refreshTableView5 tableViewDidEndDragging];
        countPage = (int)ceil([tab5Array count]/10);
        requestType = @"54";
    }
    if (state == k_RETURN_LOADMORE) {
        //self.currentPage++;
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getListByType",@"method",requestType,@"type", nil];
        [params setObject:[NSString stringWithFormat:@"%d", (countPage+1)] forKey:@"page"];
        NSLog(@"aaaa:%@", params);
        MKNetworkOperation *op = [YMGlobal getOperation:params];
        [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
            SBJsonParser *parser = [[SBJsonParser alloc]init];
            NSMutableArray *tempArray = [[NSMutableArray alloc]init];
            NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
            if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"]) {
                tempArray = [object objectForKey:@"data"];
                if (scrollView.tag == 2) {
                    for (id o in tempArray) {
                        [tab2Array addObject:o];
                    }
                    if ([tempArray count] < 10) {
                        [refreshTableView2 reloadData:NO];
                    } else {
                        [refreshTableView2 reloadData:YES];
                    }
                } else if (scrollView.tag == 3) {
                    for (id o in tempArray) {
                        [tab3Array addObject:o];
                    }
                    if ([tempArray count] < 10) {
                        [refreshTableView3 reloadData:NO];
                    } else {
                        [refreshTableView3 reloadData:YES];
                    }
                } else if (scrollView.tag == 4) {
                    for (id o in tempArray) {
                        [tab4Array addObject:o];
                    }
                    if ([tempArray count] < 10) {
                        [refreshTableView4 reloadData:NO];
                    } else {
                        [refreshTableView4 reloadData:YES];
                    }
                } else if (scrollView.tag == 5) {
                    for (id o in tempArray) {
                        [tab5Array addObject:o];
                    }
                    if ([tempArray count] < 10) {
                        [refreshTableView5 reloadData:NO];
                    } else {
                        [refreshTableView5 reloadData:YES];
                    }
                }
            }
            [HUD hide:YES];
        } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
            NSLog(@"%@",error);
            [HUD hide:YES];
        }];
        [ApplicationDelegate.appEngine enqueueOperation:op];
    }
}

// UITableView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return 150;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        UIScrollView *adScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
        [adScrollView setBackgroundColor:[UIColor grayColor]];
        tableView.tableHeaderView=adScrollView;
        return adScrollView;
    }
    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1) {
        return 6;
    } else if (tableView.tag == 2) {
        return [tab2Array count];
    } else if (tableView.tag == 3) {
        return [tab3Array count];
    } else if (tableView.tag == 4) {
        return [tab4Array count];
    } else if (tableView.tag == 5) {
        return [tab5Array count];
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]init];
    float titleLabelWidth = 220;
    if (tableView.tag == 2) {
        static NSString *cellIdentifier2 = @"NewsCell2";
        NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if(cell==nil) {
            cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        tempDictionary = [tab2Array objectAtIndex:indexPath.row];
        cell.newsTitleLabel.text = [tempDictionary objectForKey:@"title"];
        [cell.contentView addSubview:cell.newsTitleLabel];
        if (![[tempDictionary objectForKey:@"wap_thumb"] isEqualToString:@""]) {
            [YMGlobal loadImage:[tempDictionary objectForKey:@"wap_thumb"] andImageView:cell.newsImageView];
            titleLabelWidth = 220;
        } else {
            [cell.newsImageView setImage:[UIImage imageNamed:@"white"]];
            titleLabelWidth = 300;
        }
        [cell.contentView addSubview:cell.newsImageView];
        CGSize labelSize = [cell.newsTitleLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:16.0f] constrainedToSize:CGSizeMake(titleLabelWidth, 40) lineBreakMode:UILineBreakModeCharacterWrap];
        [cell.newsTitleLabel setFrame:CGRectMake(5, 5, labelSize.width, labelSize.height)];
        if (cell.newsTitleLabel.frame.size.height == 20) {
            [cell.newsDescLabel setFrame:CGRectMake(5, 28, titleLabelWidth, 20)];
            cell.newsDescLabel.text = [tempDictionary objectForKey:@"description"];
        } else {
            cell.newsDescLabel.text = @"";
        }
        [cell.contentView addSubview:cell.newsDescLabel];
        cell.newsOtherLabel.text = [NSString stringWithFormat:@"%@　%@　%@", [tempDictionary objectForKey:@"source"],[tempDictionary objectForKey:@"nickname"], [tempDictionary objectForKey:@"create_time"]];
        [cell.contentView addSubview:cell.newsOtherLabel];
        return cell;
    } else if (tableView.tag == 3) {
        static NSString *cellIdentifier3 = @"NewsCell3";
        NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier3];
        if(cell==nil) {
            cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
        }
        tempDictionary = [tab3Array objectAtIndex:indexPath.row];
        cell.newsTitleLabel.text = [tempDictionary objectForKey:@"title"];
        [cell.contentView addSubview:cell.newsTitleLabel];
        if (![[tempDictionary objectForKey:@"wap_thumb"] isEqualToString:@""]) {
            [YMGlobal loadImage:[tempDictionary objectForKey:@"wap_thumb"] andImageView:cell.newsImageView];
            titleLabelWidth = 220;
        } else {
            [cell.newsImageView setImage:[UIImage imageNamed:@"white"]];
            titleLabelWidth = 300;
        }
        [cell.contentView addSubview:cell.newsImageView];
        CGSize labelSize = [cell.newsTitleLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:16.0f] constrainedToSize:CGSizeMake(titleLabelWidth, 40) lineBreakMode:UILineBreakModeCharacterWrap];
        [cell.newsTitleLabel setFrame:CGRectMake(5, 5, labelSize.width, labelSize.height)];
        if (cell.newsTitleLabel.frame.size.height == 20) {
            [cell.newsDescLabel setFrame:CGRectMake(5, 28, titleLabelWidth, 20)];
            cell.newsDescLabel.text = [tempDictionary objectForKey:@"description"];
        } else {
            cell.newsDescLabel.text = @"";
        }
        [cell.contentView addSubview:cell.newsDescLabel];
        cell.newsOtherLabel.text = [NSString stringWithFormat:@"%@　%@　%@", [tempDictionary objectForKey:@"source"],[tempDictionary objectForKey:@"nickname"], [tempDictionary objectForKey:@"create_time"]];
        [cell.contentView addSubview:cell.newsOtherLabel];
        return cell;
    } else if (tableView.tag == 4) {
        static NSString *cellIdentifier4 = @"NewsCell4";
        NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier4];
        if(cell==nil) {
            cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier4];
        }
        tempDictionary = [tab4Array objectAtIndex:indexPath.row];
        cell.newsTitleLabel.text = [tempDictionary objectForKey:@"title"];
        [cell.contentView addSubview:cell.newsTitleLabel];
        if (![[tempDictionary objectForKey:@"wap_thumb"] isEqualToString:@""]) {
            [YMGlobal loadImage:[tempDictionary objectForKey:@"wap_thumb"] andImageView:cell.newsImageView];
            titleLabelWidth = 220;
        } else {
            [cell.newsImageView setImage:[UIImage imageNamed:@"white"]];
            titleLabelWidth = 300;
        }
        [cell.contentView addSubview:cell.newsImageView];
        CGSize labelSize = [cell.newsTitleLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:16.0f] constrainedToSize:CGSizeMake(titleLabelWidth, 40) lineBreakMode:UILineBreakModeCharacterWrap];
        [cell.newsTitleLabel setFrame:CGRectMake(5, 5, labelSize.width, labelSize.height)];
        if (cell.newsTitleLabel.frame.size.height == 20) {
            [cell.newsDescLabel setFrame:CGRectMake(5, 28, titleLabelWidth, 20)];
            cell.newsDescLabel.text = [tempDictionary objectForKey:@"description"];
        } else {
            cell.newsDescLabel.text = @"";
        }
        [cell.contentView addSubview:cell.newsDescLabel];
        cell.newsOtherLabel.text = [NSString stringWithFormat:@"%@　%@　%@", [tempDictionary objectForKey:@"source"],[tempDictionary objectForKey:@"nickname"], [tempDictionary objectForKey:@"create_time"]];
        [cell.contentView addSubview:cell.newsOtherLabel];
        return cell;
    } else if (tableView.tag == 5) {
        static NSString *cellIdentifier5 = @"NewsCell5";
        NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier5];
        if(cell==nil) {
            cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier5];
        }
        tempDictionary = [tab5Array objectAtIndex:indexPath.row];
        cell.newsTitleLabel.text = [tempDictionary objectForKey:@"title"];
        [cell.contentView addSubview:cell.newsTitleLabel];
        if (![[tempDictionary objectForKey:@"wap_thumb"] isEqualToString:@""]) {
            [YMGlobal loadImage:[tempDictionary objectForKey:@"wap_thumb"] andImageView:cell.newsImageView];
            titleLabelWidth = 220;
        } else {
            [cell.newsImageView setImage:[UIImage imageNamed:@"white"]];
            titleLabelWidth = 300;
        }
        [cell.contentView addSubview:cell.newsImageView];
        CGSize labelSize = [cell.newsTitleLabel.text sizeWithFont:[UIFont boldSystemFontOfSize:16.0f] constrainedToSize:CGSizeMake(titleLabelWidth, 40) lineBreakMode:UILineBreakModeCharacterWrap];
        [cell.newsTitleLabel setFrame:CGRectMake(5, 5, labelSize.width, labelSize.height)];
        if (cell.newsTitleLabel.frame.size.height == 20) {
            [cell.newsDescLabel setFrame:CGRectMake(5, 28, titleLabelWidth, 20)];
            cell.newsDescLabel.text = [tempDictionary objectForKey:@"description"];
        } else {
            cell.newsDescLabel.text = @"";
        }
        [cell.contentView addSubview:cell.newsDescLabel];
        cell.newsOtherLabel.text = [NSString stringWithFormat:@"%@　%@　%@", [tempDictionary objectForKey:@"source"],[tempDictionary objectForKey:@"nickname"], [tempDictionary objectForKey:@"create_time"]];
        [cell.contentView addSubview:cell.newsOtherLabel];
        return cell;
    } else {
        static NSString *cellIdentifier1 = @"NewsCell1";
        NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
        if(cell==nil) {
            cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1];
        }
        [cell.contentView addSubview:cell.newsTitleLabel];
        cell.newsTitleLabel.text = @"testtestwttt";
        //    [YMGlobal loadImage:goodsModel.imageUrl andImageView:cell.goodsImageView];
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]init];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    switch (tableView.tag) {
        case 1:
            tempArray = tab1Array;
            break;
        case 2:
            tempArray = tab2Array;
            break;
        case 3:
            tempArray = tab3Array;
            break;
        case 4:
            tempArray = tab4Array;
            break;
        case 5:
            tempArray = tab5Array;
            break;
    }
    tempDictionary = [tempArray objectAtIndex:indexPath.row];
    ZixunContentViewController *zixunContentView = [[ZixunContentViewController alloc]init];
    zixunContentView.zixunId = [tempDictionary objectForKey:@"id"];
    [self.navigationController pushViewController:zixunContentView animated:YES];
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
    [self setRefreshTableView1:nil];
    [self setRefreshTableView2:nil];
    [self setRefreshTableView3:nil];
    [self setRefreshTableView4:nil];
    [self setRefreshTableView5:nil];
    [self setTab1Array:nil];
    [self setTab2Array:nil];
    [self setTab3Array:nil];
    [self setTab4Array:nil];
    [self setTab5Array:nil];
    [super viewDidUnload];
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
        tabScrollView.tag = 100;
    }
    return tabScrollView;
}
- (UITableView *)refreshTableView1
{
    if (refreshTableView1 == nil) {
        refreshTableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 414)];
        [refreshTableView1 setRowHeight:80.0];
        [refreshTableView4 setBackgroundColor:[UIColor yellowColor]];
        refreshTableView1.delegate = self;
        refreshTableView1.dataSource = self;
        refreshTableView1.tag = 1;
    }
    return refreshTableView1;
}
- (PullToRefreshTableView *)refreshTableView2
{
    if (refreshTableView2 == nil) {
        refreshTableView2 = [[PullToRefreshTableView alloc]initWithFrame:CGRectMake(320, 0, 320, 414)];
        [refreshTableView2 setRowHeight:80.0];
        refreshTableView2.delegate = self;
        refreshTableView2.dataSource = self;
        refreshTableView2.tag = 2;
    }
    return refreshTableView2;
}
- (PullToRefreshTableView *)refreshTableView3
{
    if (refreshTableView3 == nil) {
        refreshTableView3 = [[PullToRefreshTableView alloc]initWithFrame:CGRectMake(640, 0, 320, 414)];
        [refreshTableView3 setRowHeight:80.0];
        refreshTableView3.delegate = self;
        refreshTableView3.dataSource = self;
        refreshTableView3.tag = 3;
    }
    return refreshTableView3;
}
- (PullToRefreshTableView *)refreshTableView4
{
    if (refreshTableView4 == nil) {
        refreshTableView4 = [[PullToRefreshTableView alloc]initWithFrame:CGRectMake(960, 0, 320, 414)];
        [refreshTableView4 setRowHeight:80.0];
        refreshTableView4.delegate = self;
        refreshTableView4.dataSource = self;
        refreshTableView4.tag = 4;
    }
    return refreshTableView4;
}
- (PullToRefreshTableView *)refreshTableView5
{
    if (refreshTableView5 == nil) {
        refreshTableView5 = [[PullToRefreshTableView alloc]initWithFrame:CGRectMake(1280, 0, 320, 414)];
        [refreshTableView5 setRowHeight:80.0];
        refreshTableView5.delegate = self;
        refreshTableView5.dataSource = self;
        refreshTableView5.tag = 5;
    }
    return refreshTableView5;
}
- (NSMutableArray *)tab1Array
{
    if (tab1Array == nil) {
        tab1Array = [[NSMutableArray alloc]init];
    }
    return tab1Array;
}
- (NSMutableArray *)tab2Array
{
    if (tab2Array == nil) {
        tab2Array = [[NSMutableArray alloc]init];
    }
    return tab2Array;
}
@end
