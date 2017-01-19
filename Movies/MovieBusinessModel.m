//
//  MovieBusinessModel.m
//  Movies
//
//  Created by Guilherme Ferreira on 18/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "MovieBusinessModel.h"

@implementation MovieBusinessModel

- (instancetype)initWithActors:(NSString *)actors withAwards:(NSString *)awards withCountry:(NSString *)country withDirector:(NSString *)director withGenre:(NSString *)genre withLanguage:(NSString *)language withImdbRating:(double)imdbRating withImdbId:(double)imdbId withMetascore:(NSString *)metascore withPlot:(NSString *)plot withPoster:(NSString *)poster withRated:(NSString *)rated withReleased:(NSString *)released withResponse:(NSString *)response withRuntime:(NSString *)runtime withTitle:(NSString *)title withType:(NSString *)type withWriter:(NSString *)writer withYear:(NSNumber *)year {
    
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
                       withYear:[NSNumber numberWithInt:movieManagedObject.year]];
}

@end
