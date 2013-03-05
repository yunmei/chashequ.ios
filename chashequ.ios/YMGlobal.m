//
//  YMGlobal.m
//  chashequ.ios
//
//  Created by ken on 13-3-5.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "YMGlobal.h"

@implementation YMGlobal

+ (MKNetworkOperation *)getOperation:(NSMutableDictionary *)params
{
    [params setObject:API_KEY forKey:@"apikey"];
    [params setObject:@"json" forKey:@"format"];
    return [ApplicationDelegate.appEngine operationWithPath:API_BASEURL params:params httpMethod:API_METHOD ssl:NO];
}
@end
