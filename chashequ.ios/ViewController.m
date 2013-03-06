//
//  ViewController.m
//  chashequ.ios
//
//  Created by bevin chen on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pageControlView;
@synthesize currentTabBtn;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *tabImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    [tabImageView setImage:[UIImage imageNamed:@"tab_bg.png"]];
    [self.view addSubview:tabImageView];
    [self.view addSubview:self.pageControlView];
    
    // 创建TabButton
    UIButton *btnTab1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 64, 42)];
    [btnTab1 setTag:1];
    [btnTab1 setTitle:@"头条" forState:UIControlStateNormal];
    [btnTab1.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [btnTab1 setTitleColor:[UIColor colorWithRed:61/255.0 green:157/255.0 blue:1/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnTab1 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [btnTab1 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTab1];
    self.currentTabBtn = btnTab1;
    
    UIButton *btnTab2 = [[UIButton alloc]initWithFrame:CGRectMake(65, 0, 64, 42)];
    [btnTab2 setTag:2];
    [btnTab2 setTitle:@"资讯" forState:UIControlStateNormal];
    [btnTab2.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [btnTab2 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnTab2 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [btnTab2 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTab2];
    
    UIButton *btnTab3 = [[UIButton alloc]initWithFrame:CGRectMake(129, 0, 64, 42)];
    [btnTab3 setTag:3];
    [btnTab3 setTitle:@"经营" forState:UIControlStateNormal];
    [btnTab3.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [btnTab3 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnTab3 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [btnTab3 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTab3];
    
    UIButton *btnTab4 = [[UIButton alloc]initWithFrame:CGRectMake(193, 0, 64, 42)];
    [btnTab4 setTag:4];
    [btnTab4 setTitle:@"茶百科" forState:UIControlStateNormal];
    [btnTab4.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [btnTab4 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnTab4 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [btnTab4 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTab4];
    
    UIButton *btnTab5 = [[UIButton alloc]initWithFrame:CGRectMake(257, 0, 64, 42)];
    [btnTab5 setTag:5];
    [btnTab5 setTitle:@"数据" forState:UIControlStateNormal];
    [btnTab5.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [btnTab5 setTitleColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btnTab5 setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [btnTab5 addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTab5];
    
    
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
    pageControlView.frame = CGRectMake((typeBtn.tag-1) * 64, 42, 64, 3);
    [UIView commitAnimations];
    
    NSLog(@"tag.id:%d", typeBtn.tag);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPageControlView:nil];
    [self setCurrentTabBtn:nil];
    [super viewDidUnload];
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
@end
