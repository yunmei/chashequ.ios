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

@interface SNViewController : UIViewController<SinaWeiboDelegate, SinaWeiboRequestDelegate>
@property (strong, nonatomic) IBOutlet UIButton *login;
@property (strong, nonatomic) IBOutlet UIButton *logout;

@end
