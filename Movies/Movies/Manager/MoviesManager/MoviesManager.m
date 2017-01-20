//
//  MoviesManager.m
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "MoviesManager.h"

#import "CoreDataManager.h"
#import "SessionManager.h"

@implementation MoviesManager

+ (id)sharedInstance {
    
    static MoviesManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSArray<MovieBusinessModel *> *)getAllMoviesFromDatabase {
    
    CoreDataManager *coreDataManager = [[CoreDataManager alloc] initWithNewManagedObjectContext];
    NSArray<MovieBusinessModel *> *result = [coreDataManager getAllMovies];
    
    return result;
}

- (void)insertMovieWithName:(NSString *)movieName withSuccessCompletionNotification:(kSuccessCompletionNotification)sucessCompletionNotification withFailureCompletionNotification:(kFailureCompletionNotification)failureCompletionNotification {

    NSMutableDictionary *parametersDictionary = [[NSMutableDictionary alloc] init];
    [parametersDictionary setObject:movieName forKey:@"t"];
    
    [[SessionManager sharedInstance] GET:@"" parameters:parametersDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        MovieBusinessModel *movieModel = [[MovieBusinessModel alloc] initWithDictionary:responseObject];
        
        CoreDataManager *coreDataManager = [[CoreDataManager alloc] initWithNewManagedObjectContext];
        
        if ([coreDataManager movieFromImdbId:movieModel.imdbId].imdbId) {
            
            NSError *error = [NSError errorWithDomain:@"Local error" code:1000 userInfo:nil];
            
            if (failureCompletionNotification) {
                failureCompletionNotification(error);
            }
        }
        else {
            [coreDataManager insertNewMovie:movieModel];
            
            if (sucessCompletionNotification) {
                sucessCompletionNotification();
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failureCompletionNotification) {
            failureCompletionNotification(error);
        }
    }];
}

- (BOOL)deleteMovieWithImbdID:(NSString *)imdbId {
    
    CoreDataManager *coreDataManager = [[CoreDataManager alloc] initWithNewManagedObjectContext];
    BOOL result = [coreDataManager deleteMovieWithImbdID:imdbId];
    
    return result;
}

@end
