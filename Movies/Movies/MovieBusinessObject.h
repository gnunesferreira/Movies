//
//  MovieBusinessObject.h
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieBusinessModel.h"
#import "MoviesManager.h"

@interface MovieBusinessObject : NSObject

+ (NSArray<MovieBusinessModel *> *)getAllMoviesToShow;

+ (void)insertMovieWithName:(NSString *)movieName withSuccessCompletionNotification:(kSuccessCompletionNotification)sucessCompletionNotification withFailureCompletionNotification:(kFailureCompletionNotification)failureCompletionNotification;

+ (BOOL)deleteMovieWithImbdID:(NSString *)imdbId;

@end
