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
