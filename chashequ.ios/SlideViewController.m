//
//  SlideViewController.m
//  chashequ.ios
//
//  Created by ken on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "SlideViewController.h"
#import "MKNetworkEngine.h"
#import "YMGlobal.h"
#import "SBJson.h"
@interface SlideViewController ()

@end

@implementation SlideViewController
@synthesize pageControl = _pageControl;
@synthesize pageScroll = _pageScroll;
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
//    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"news.getSlideshow",@"method", nil];
//    MKNetworkOperation *op = [YMGlobal getOperation:params];
//    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
//        SBJsonParser *parser = [[SBJsonParser alloc]init];
//        NSMutableDictionary *object = [parser objectWithData:[completedOperation responseData]];
//        if([[object objectForKey:@"errorMessage"] isEqualToString:@"success"])
//        {
//            NSLog(@"data:%@",[object objectForKey:@"data"]);
//        }
//    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
//    [ApplicationDelegate.appEngine enqueueOperation:op];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIPageControl *)pageControl
{
    if(_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(141, 424, 38, 36)];
    }
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    return _pageControl;
}

-(UIScrollView *)pageScroll
{
    if(_pageScroll == nil)
    {
        _pageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    }
    [_pageScroll setContentSize:CGSizeMake(self.view.frame.size.width * 5 , self.view.frame.size.height)];
    _pageScroll.delegate = self;
    return  _pageScroll;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat pageWidth = self.view 
//}
@end
