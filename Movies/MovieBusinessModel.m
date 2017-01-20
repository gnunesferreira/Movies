//
//  MovieBusinessModel.m
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "MovieBusinessModel.h"

#import "Movie+CoreDataClass.h"

@implementation MovieBusinessModel

- (instancetype)initWithActors:(NSString *)actors withAwards:(NSString *)awards withCountry:(NSString *)country withDirector:(NSString *)director withGenre:(NSString *)genre withLanguage:(NSString *)language withImdbRating:(NSString *)imdbRating withImdbId:(NSString *)imdbId withMetascore:(NSString *)metascore withPlot:(NSString *)plot withPoster:(NSString *)poster withRated:(NSString *)rated withReleased:(NSString *)released withResponse:(NSString *)response withRuntime:(NSString *)runtime withTitle:(NSString *)title withType:(NSString *)type withWriter:(NSString *)writer withYear:(NSString *)year {
    
    self = [super init];
    
    if (self) {
        self.actors = actors;
        self.awards = awards;
        self.country = country;
        self.director = director;
        self.genre = genre;
        self.language = language;
        self.imdbRating = imdbRating;
        self.imdbId = imdbId;
        self.metascore = metascore;
        self.plot = plot;
        self.poster = poster;
        self.rated = rated;
        self.released = released;
        self.response = response;
        self.runtime = runtime;
        self.title = title;
        self.type = type;
        self.writer = writer;
        self.year = year;
    }
    
    return self;
}

- (instancetype)initWithMovieManagedObject:(Movie *)movieManagedObject {
    
    return [self initWithActors:movieManagedObject.actors
                     withAwards:movieManagedObject.awards
                    withCountry:movieManagedObject.country
                   withDirector:movieManagedObject.director
                      withGenre:movieManagedObject.genre
                   withLanguage:movieManagedObject.language
                 withImdbRating:movieManagedObject.imdbRating
                     withImdbId:movieManagedObject.imdbId
                  withMetascore:movieManagedObject.metascore
                       withPlot:movieManagedObject.plot
                     withPoster:movieManagedObject.poster
                      withRated:movieManagedObject.rated
                   withReleased:movieManagedObject.released
                   withResponse:movieManagedObject.response
                    withRuntime:movieManagedObject.runtime
                      withTitle:movieManagedObject.title
                       withType:movieManagedObject.type
                     withWriter:movieManagedObject.writer
                       withYear:movieManagedObject.year];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    return [self initWithActors:[dictionary objectForKey:@"Actors"]
                     withAwards:[dictionary objectForKey:@"Awards"]
                    withCountry:[dictionary objectForKey:@"Country"]
                   withDirector:[dictionary objectForKey:@"Director"]
                      withGenre:[dictionary objectForKey:@"Genre"]
                   withLanguage:[dictionary objectForKey:@"Language"]
                 withImdbRating:[dictionary objectForKey:@"imdbRating"]
                     withImdbId:[dictionary objectForKey:@"imdbID"]
                  withMetascore:[dictionary objectForKey:@"Metascore"]
                       withPlot:[dictionary objectForKey:@"Plot"]
                     withPoster:[dictionary objectForKey:@"Poster"]
                      withRated:[dictionary objectForKey:@"Rated"]
                   withReleased:[dictionary objectForKey:@"Realesed"]
                   withResponse:[dictionary objectForKey:@"Response"]
                    withRuntime:[dictionary objectForKey:@"Runtime"]
                      withTitle:[dictionary objectForKey:@"Title"]
                       withType:[dictionary objectForKey:@"Type"]
                     withWriter:[dictionary objectForKey:@"Writer"]
                       withYear:[dictionary objectForKey:@"Year"]
            ];
}

- (NSArray<MovieBusinessModel *> *)arrayWithMoviesManagedObjectArray:(NSArray<Movie *> *)moviesManagedObjectArray {
    
    __block NSMutableArray<MovieBusinessModel *> *result = [[NSMutableArray alloc] init];
    
    [moviesManagedObjectArray enumerateObjectsUsingBlock:^(Movie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        MovieBusinessModel *newInstance = [[MovieBusinessModel alloc] initWithMovieManagedObject:obj];
        [result addObject:newInstance];
    }];
    
    return result;
}

@end
