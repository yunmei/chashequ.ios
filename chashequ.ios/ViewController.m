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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getSlideshow",@"method", nil];
    MKNetworkOperation *op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSLog(@"%@",[completedOperation responseString]);
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        //NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
  
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

@end
