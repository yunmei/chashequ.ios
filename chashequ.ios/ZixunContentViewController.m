//
//  ZixunContentViewController.m
//  chashequ.ios
//
//  Created by ken on 13-3-6.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "ZixunContentViewController.h"
#import "YMGlobal.h"
#import "SBJson.h"

@interface ZixunContentViewController ()

@end

@implementation ZixunContentViewController
@synthesize swipeGesture = _swipeGesture;
@synthesize zixunId;
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
    [self.view addGestureRecognizer:self.swipeGesture];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getNewsContent",@"method",self.zixunId,@"id", nil];
    MKNetworkOperation *op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSLog(@"zixuncontent%@",[completedOperation responseString]);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UISwipeGestureRecognizer *)swipeGesture
{
    if(_swipeGesture == nil)
    {
        _swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(goBack:)];
    }
    _swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    return _swipeGesture;
}
@end
