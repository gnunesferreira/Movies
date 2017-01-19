//
//  Movie+CoreDataProperties.h
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Movie+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Movie (CoreDataProperties)

+ (NSFetchRequest<Movie *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) int16_t year;
@property (nullable, nonatomic, copy) NSString *rated;
@property (nullable, nonatomic, copy) NSString *released;
@property (nullable, nonatomic, copy) NSString *runtime;
@property (nullable, nonatomic, copy) NSString *genre;
@property (nullable, nonatomic, copy) NSString *director;
@property (nullable, nonatomic, copy) NSString *writer;
@property (nullable, nonatomic, copy) NSString *actors;
@property (nullable, nonatomic, copy) NSString *plot;
@property (nullable, nonatomic, copy) NSString *language;
@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, copy) NSString *awards;
@property (nullable, nonatomic, copy) NSString *poster;
@property (nullable, nonatomic, copy) NSString *metascore;
@property (nonatomic) double imdbRating;
@property (nonatomic) double imdbId;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSString *response;

@end

NS_ASSUME_NONNULL_END
