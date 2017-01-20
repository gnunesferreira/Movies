//
//  MovieBusinessObject.m
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "MovieBusinessObject.h"

#import "MoviesManager.h"

@implementation MovieBusinessObject

+ (NSArray<MovieBusinessModel *> *)getAllMoviesToShow {

    return [[MoviesManager sharedInstance] getAllMoviesFromDatabase];
}

+ (void)insertMovieWithName:(NSString *)movieName withSuccessCompletionNotification:(kSuccessCompletionNotification)sucessCompletionNotification withFailureCompletionNotification:(kFailureCompletionNotification)failureCompletionNotification {

    [[MoviesManager sharedInstance] insertMovieWithName:movieName withSuccessCompletionNotification:sucessCompletionNotification withFailureCompletionNotification:failureCompletionNotification];
}

+ (BOOL)deleteMovieWithImbdID:(NSString *)imdbId {
    
    return [[MoviesManager sharedInstance] deleteMovieWithImbdID:imdbId];
}

@end
