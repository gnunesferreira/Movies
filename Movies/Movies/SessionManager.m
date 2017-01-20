//
//  SessionManager.m
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "SessionManager.h"

static NSString *baseURL = @"http://www.omdbapi.com";

@implementation SessionManager

+ (instancetype)sharedInstance {
    
    static SessionManager * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURL *url = [[NSURL alloc] initWithString:baseURL];
        _sharedInstance = [[SessionManager alloc] initWithBaseURL:url];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return self;
}

@end
