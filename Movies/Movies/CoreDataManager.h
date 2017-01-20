//
//  CoreDataManager.h
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieBusinessModel.h"

@interface CoreDataManager : NSObject

- (instancetype)initWithNewManagedObjectContext;

//Movies
- (BOOL)insertNewMovie:(MovieBusinessModel *)movie;
- (NSArray<MovieBusinessModel *> *)getAllMovies;
- (BOOL)deleteMovieWithImbdID:(NSString *)imdbId;
- (MovieBusinessModel *)movieFromImdbId:(NSString *)imdbID;

@end
