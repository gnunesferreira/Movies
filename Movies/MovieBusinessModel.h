//
//  MovieBusinessModel.h
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Movie+CoreDataClass.h"

@interface MovieBusinessModel : NSObject

@property (nonatomic,strong) NSString *actors;
@property (nonatomic,strong) NSString *awards;
@property (nonatomic,strong) NSString *country;
@property (nonatomic,strong) NSString *director;
@property (nonatomic,strong) NSString *genre;
@property (nonatomic,strong) NSString *language;
@property (nonatomic) double imdbRating;
@property (nonatomic) double imdbId;
@property (nonatomic,strong) NSString *metascore;
@property (nonatomic,strong) NSString *plot;
@property (nonatomic,strong) NSString *poster;
@property (nonatomic,strong) NSString *rated;
@property (nonatomic,strong) NSString *released;
@property (nonatomic,strong) NSString *response;
@property (nonatomic,strong) NSString *runtime;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *writer;
@property (nonatomic) NSNumber *year;

- (instancetype)initWithActors:(NSString *)actors withAwards:(NSString *)awards withCountry:(NSString *)country withDirector:(NSString *)director withGenre:(NSString *)genre withLanguage:(NSString *)language withImdbRating:(double)imdbRating withImdbId:(double)imdbId withMetascore:(NSString *)metascore withPlot:(NSString *)plot withPoster:(NSString *)poster withRated:(NSString *)rated withReleased:(NSString *)released withResponse:(NSString *)response withRuntime:(NSString *)runtime withTitle:(NSString *)title withType:(NSString *)type withWriter:(NSString *)writer withYear:(NSNumber *)year;

@end
