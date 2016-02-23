//
//  HttpRequestManager.m
//  Lottery
//
//  Created by user on 16/2/17.
//  Copyright © 2016年 user. All rights reserved.
//

#import "HttpRequestManager.h"
#import "AFNetworking.h"

@interface HttpRequestManager()

@end

@implementation HttpRequestManager

+ (HttpRequestManager*)sharedInstance {
	
	static HttpRequestManager *_instance;
	
	static dispatch_once_t predicate;
	
	dispatch_once(&predicate, ^{
		
		_instance = [[HttpRequestManager alloc] init];
	});
	
	return _instance;
}

- (void)get:(NSString*)url data:(NSDictionary*)data success:(void(^)(NSDictionary* data))success failure:(void(^)(NSDictionary* data))failure {
	
	[[AFHTTPSessionManager manager] GET:url parameters:data success:^(NSURLSessionDataTask * task, id responseObject) {
		
		success(responseObject);
		
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		
		failure(nil);
	}];
}

- (void)post:(NSString*)url data:(NSDictionary*)data success:(void(^)(NSDictionary* data))success failure:(void(^)(NSDictionary* data))failure {

	[[AFHTTPSessionManager manager] POST:url parameters:data success:^(NSURLSessionDataTask * task, id responseObject) {
		
		success(responseObject);
		
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		
		failure(nil);
	}];
}

@end
