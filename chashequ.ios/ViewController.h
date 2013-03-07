//
//  ViewController.h
//  chashequ.ios
//
//  Created by bevin chen on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMGlobal.h"
#import "SBJson.h"
#import "ZixunContentViewController.h"
#import "PullToRefreshTableView.h"

@interface ViewController : UIViewController<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIButton *btnTab1;
@property (strong, nonatomic) UIButton *btnTab2;
@property (strong, nonatomic) UIButton *btnTab3;
@property (strong, nonatomic) UIButton *btnTab4;
@property (strong, nonatomic) UIButton *btnTab5;
@property (strong, nonatomic) UIImageView *pageControlView;
@property (strong, nonatomic) UIButton *currentTabBtn;
@property (strong, nonatomic) UIScrollView *tabScrollView;

@property (strong, nonatomic) PullToRefreshTableView *refreshTableView2;

@end
