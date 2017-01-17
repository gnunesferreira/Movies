//
//  MoviesManager.h
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^kSuccessCompletionNotification)(void);
typedef void(^kFailureCompletionNotification)(NSError *error);

@interface MoviesManager : NSObject

+ (instancetype)sharedInstance;

- (void)insertMovieWithSuccessCompletionNotification:(kSuccessCompletionNotification)sucessCompletionNotification withFailureCompletionNotification:(kFailureCompletionNotification)failureCompletionNotification;

@end
