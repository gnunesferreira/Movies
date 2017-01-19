//
//  Movie+CoreDataProperties.m
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Movie+CoreDataProperties.h"

@implementation Movie (CoreDataProperties)

+ (NSFetchRequest<Movie *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Movie"];
}

@dynamic title;
@dynamic year;
@dynamic rated;
@dynamic released;
@dynamic runtime;
@dynamic genre;
@dynamic director;
@dynamic writer;
@dynamic actors;
@dynamic plot;
@dynamic language;
@dynamic country;
@dynamic awards;
@dynamic poster;
@dynamic metascore;
@dynamic imdbRating;
@dynamic imdbId;
@dynamic type;
@dynamic response;

@end
