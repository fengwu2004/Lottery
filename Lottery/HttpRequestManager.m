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

@property (nonatomic, retain) AFHTTPSessionManager *httpSession;
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

- (id)init {
	
	self = [super init];
	
	_httpSession = [[AFHTTPSessionManager alloc] init];
	
	return self;
}

- (void)post:(NSString*)url data:(NSDictionary*)data success:(void(^)(NSDictionary* data))success failure:(void(^)(NSDictionary* data))failure {

	[_httpSession POST:url parameters:data success:^(NSURLSessionDataTask * task, id responseObject) {
		
		success(responseObject);
		
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		
		failure(nil);
	}];
}

@end
