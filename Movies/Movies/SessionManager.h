//
//  SessionManager.h
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

@interface SessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
