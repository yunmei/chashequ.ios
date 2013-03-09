//
//  SNViewController.h
//  chashequ.ios
//
//  Created by ken on 13-3-8.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "SinaWeiboRequest.h"
#import <QuartzCore/QuartzCore.h>
@interface SNViewController : UIViewController<SinaWeiboDelegate, SinaWeiboRequestDelegate>
{
    UIButton *_shareButton;
    
    UITextView *_textView;
    
    UIView *_shareView;
    
    UIActivityIndicatorView *_indicator;
}
@property (strong, nonatomic) UIButton *shareButton;

@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) UIView *shareView;

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

- (void) addButton;

- (void) addShareView;

- (void) share:(UIButton*) sender;

- (void) removeShare:(UIButton*) sender;

- (void) sendShare:(UIButton*) sender;

- (void) exitShare:(UIButton*) sender;


@end
