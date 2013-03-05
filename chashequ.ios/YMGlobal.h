//
//  YMGlobal.h
//  chashequ.ios
//
//  Created by ken on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "AppDelegate.h"

@interface YMGlobal : NSObject

//获取MKNetworkOperation
+ (MKNetworkOperation *)getOperation:(NSMutableDictionary *)params;

@end
