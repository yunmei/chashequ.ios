//
//  ZixunContentViewController.h
//  chashequ.ios
//
//  Created by ken on 13-3-6.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZixunContentViewController : UIViewController<
UIWebViewDelegate,
UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong,nonatomic)UISwipeGestureRecognizer *swipeGesture;
@property (strong,nonatomic)NSString *zixunId;
@property (strong,nonatomic)UIWebView *contentWebView;
@property (strong,nonatomic)UILabel *contentTitleLable;
@property (strong,nonatomic)UIView *headerView;
@property (strong,nonatomic)UILabel *detailLable;
@end
