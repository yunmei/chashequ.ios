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
@synthesize welcomImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"11");
	// Do any additional setup after loading the view, typically from a nib.
    //self.view.
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if((screenWidth == 568)||(screenHeight == 568))
    {
        [self.welcomImage setImage:[UIImage imageNamed:@"wait568.jpg"]];
    }else{
        [self.welcomImage setImage:[UIImage imageNamed:@"wait960.jpg"]];
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getWelcome",@"method", nil];
    MKNetworkOperation *op = [YMGlobal getOperation:params];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
        if([[object objectForKey:@"errorMessage"]isEqualToString:@"success"])
        {
            NSMutableDictionary *data = [object objectForKey:@"data"];
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"%@",error);
    }];
    [ApplicationDelegate.appEngine enqueueOperation:op];
    [self performSelector:@selector(changeView) withObject:self afterDelay:3];
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWelcomImage:nil];
    [super viewDidUnload];
}

-(void)changeView
{
    SlideViewController *slide = [[SlideViewController alloc]init];
    [self presentModalViewController:slide animated:NO];

}
@end
