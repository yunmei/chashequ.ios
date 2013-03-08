//
//  SNViewController.m
//  chashequ.ios
//
//  Created by ken on 13-3-8.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "SNViewController.h"
#import "AppDelegate.h"
@interface SNViewController ()

@end

@implementation SNViewController
@synthesize login;
@synthesize logout;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [login addTarget:self action:@selector(loginWeibo:) forControlEvents:UIControlEventTouchUpInside];
    [logout addTarget:self action:@selector(logoutWeibo:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLogin:nil];
    [self setLogout:nil];
    [super viewDidUnload];
}

- (void)loginWeibo:(id)sender
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    [sinaweibo logIn];
}

- (void)logoutWeibo:(id)sender
{
    SinaWeibo *sinaweibo = [self sinaweibo];
    [sinaweibo logIn];
}


//一下内容为sinaWeibo系统函数
- (SinaWeibo *)sinaweibo
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.sinaweibo;
}
@end
