//
//  HttpRequestManager.h
//  Lottery
//
//  Created by user on 16/2/17.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpRequestManager : NSObject

+ (HttpRequestManager*)sharedInstance;

- (void)post:(NSString*)url data:(NSDictionary*)data success:(void(^)(NSDictionary* data))success failure:(void(^)(NSDictionary* data))failure;

- (void)get:(NSString*)url data:(NSDictionary*)data success:(void(^)(NSDictionary* data))success failure:(void(^)(NSDictionary* data))failure;

@end
