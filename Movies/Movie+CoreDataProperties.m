//
//  Movie+CoreDataProperties.m
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Movie+CoreDataProperties.h"

@implementation Movie (CoreDataProperties)

+ (NSFetchRequest<Movie *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Movie"];
}

@dynamic actors;
@dynamic awards;
@dynamic country;
@dynamic director;
@dynamic genre;
@dynamic imdbId;
@dynamic imdbRating;
@dynamic language;
@dynamic metascore;
@dynamic plot;
@dynamic poster;
@dynamic rated;
@dynamic released;
@dynamic response;
@dynamic runtime;
@dynamic title;
@dynamic type;
@dynamic writer;
@dynamic year;

@end
