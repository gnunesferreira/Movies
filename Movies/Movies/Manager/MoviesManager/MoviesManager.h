//
//  MoviesManager.h
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieBusinessModel.h"

typedef void(^kSuccessCompletionNotification)(void);
typedef void(^kFailureCompletionNotification)(NSError *error);

@interface MoviesManager : NSObject

+ (instancetype)sharedInstance;

- (void)insertMovieWithName:(NSString *)movieName withSuccessCompletionNotification:(kSuccessCompletionNotification)sucessCompletionNotification withFailureCompletionNotification:(kFailureCompletionNotification)failureCompletionNotification;
- (NSArray<MovieBusinessModel *> *)getAllMoviesFromDatabase;
- (BOOL)deleteMovieWithImbdID:(NSString *)imdbId;

@end
