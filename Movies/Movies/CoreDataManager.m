//
//  CoreDataManager.m
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "CoreDataManager.h"

#import "AppDelegate.h"

static NSString *kEntityNameMovie = @"Movie";

@interface CoreDataManager()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataManager

- (instancetype)initWithNewManagedObjectContext {
    
    self = [super init];
    
    if (self) {
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext* context = [[NSManagedObjectContext alloc]
                                           initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        context.parentContext = appDelegate.managedObjectContext;
        self.managedObjectContext = context;
    }
    
    return self;
}

- (BOOL)saveContext {
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        
        NSLog(@"CoreDataManager: Error to save: %@", [error localizedDescription]);
        return NO;
    }
    else {
        
        if (![self.managedObjectContext.parentContext save:&error]) {
            NSLog(@"CoreDataManager: Error to save: %@", [error localizedDescription]);
            return NO;
        }
        else {
            return YES;
        }
    }
}

#pragma mark - Movie methods

- (BOOL)insertNewMovie:(MovieBusinessModel *)movie {
    
    Movie *movieManagedObject = [NSEntityDescription insertNewObjectForEntityForName:kEntityNameMovie inManagedObjectContext:self.managedObjectContext];
    movieManagedObject.actors = movie.actors;
    movieManagedObject.awards = movie.awards;
    movieManagedObject.country = movie.country;
    movieManagedObject.director = movie.director;
    movieManagedObject.genre = movie.genre;
    movieManagedObject.language = movie.language;
    movieManagedObject.imdbRating = movie.imdbRating;
    movieManagedObject.imdbId = movie.imdbId;
    movieManagedObject.metascore = movie.metascore;
    movieManagedObject.plot = movie.plot;
    movieManagedObject.poster = movie.poster;
    movieManagedObject.rated = movie.rated;
    movieManagedObject.released = movie.released;
    movieManagedObject.response = movie.response;
    movieManagedObject.runtime = movie.runtime;
    movieManagedObject.title = movie.title;
    movieManagedObject.type = movie.type;
    movieManagedObject.writer = movie.writer;
    movieManagedObject.year = movie.year;
    
    return [self saveContext];
}

- (NSArray<MovieBusinessModel *> *)getAllMovies {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityNameMovie inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"CoreDataManager: Error to get Movie: %@", error.localizedDescription);
    }
    
    return [[MovieBusinessModel alloc] arrayWithMoviesManagedObjectArray:fetchedObjects];
}

- (BOOL)deleteMovieWithImbdID:(NSString *)imdbId {
    
    [self.managedObjectContext deleteObject:[self movieManagedObjectFromImdbID:imdbId]];
    
    return [self saveContext];
}

- (Movie *)movieManagedObjectFromImdbID:(NSString *)imdbId {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityNameMovie inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify how the fetched objects should be sorted
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"imdbId == %@", imdbId];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"CoreDataManager: Error to get Movie: %@", error.localizedDescription);
    }
    
    return [fetchedObjects firstObject];
}

- (MovieBusinessModel *)movieFromImdbId:(NSString *)imdbID {
    return [[MovieBusinessModel alloc] initWithMovieManagedObject:[self movieManagedObjectFromImdbID:imdbID]];
}


@end
