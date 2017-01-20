//
//  MovieDetailViewController.m
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "MovieDetailViewController.h"

#import <UIImageView+AFNetworking.h>

@interface MovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *genreTextView;
@property (weak, nonatomic) IBOutlet UITextView *plotTextView;
@property (weak, nonatomic) IBOutlet UITextView *countryTextView;
@property (weak, nonatomic) IBOutlet UITextView *writerTextView;
@property (weak, nonatomic) IBOutlet UITextView *actorTextView;
@property (weak, nonatomic) IBOutlet UITextView *directorTextView;
@property (weak, nonatomic) IBOutlet UITextView *runtimeTextView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Movie";
    
    self.moviePoster.layer.borderColor = [UIColor blackColor].CGColor;
    self.moviePoster.layer.borderWidth = 3.0f;
    
    [self.moviePoster setImageWithURL:[NSURL URLWithString:self.movie.poster] placeholderImage:[UIImage imageNamed:@"movie"]];
    
    self.titleTextView.text = self.movie.title;
    self.genreTextView.text = self.movie.genre;
    self.plotTextView.text = self.movie.plot;
    self.countryTextView.text = self.movie.country;
    self.writerTextView.text = self.movie.writer;
    self.actorTextView.text = self.movie.actors;
    self.directorTextView.text = self.movie.director;
    self.runtimeTextView.text = self.movie.runtime;
}


@end
