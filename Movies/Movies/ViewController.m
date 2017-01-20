//
//  ViewController.m
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "ViewController.h"

#import "InsertMovieViewController.h"
#import "MovieBusinessObject.h"
#import "MovieDetailViewController.h"
#import "MovieTitleTableViewCell.h"

static NSString *kViewControllerToDetailSegueIdentifier = @"kViewControllerToDetailSegueIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (nonatomic, strong) NSMutableArray<MovieBusinessModel *> *moviesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Movies";
    
    self.moviesArray = [[NSMutableArray alloc] init];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.rowHeight = UITableViewAutomaticDimension;
    self.contentTableView.estimatedRowHeight = 180;
 
    [self updateContent];
}

- (void)updateContent {
    self.moviesArray = [[NSMutableArray alloc] initWithArray:[MovieBusinessObject getAllMoviesToShow]];
    [self.contentTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (segue.identifier) {
        
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        MovieDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.movie = [self.moviesArray objectAtIndex:indexPath.row];
    }
}

#pragma mark - IBAction

- (IBAction)navigationBarRightButtonAction:(id)sender {
    
    InsertMovieViewController *insertMoviewViewController = [[InsertMovieViewController alloc] initWithNibName:@"InsertMovieViewController" bundle:nil withCloseCompletion:^{
        
        [self updateContent];
    }];
    [insertMoviewViewController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:insertMoviewViewController animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MovieTitleTableViewCell *cell = (MovieTitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieTitleTableViewCell" owner:nil options:nil] objectAtIndex: 0];;
    }
    
    MovieBusinessModel *movie = [self.moviesArray objectAtIndex:indexPath.row];
    [cell.movieTitleLabel setText:movie.title];
    
    return cell;
}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 60;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return CGFLOAT_MIN;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    
        MovieBusinessModel *deletedMovie = [self.moviesArray objectAtIndex:indexPath.row];
        [self.moviesArray removeObjectAtIndex:indexPath.row];
        [self.contentTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [MovieBusinessObject deleteMovieWithImbdID:deletedMovie.imdbId];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:kViewControllerToDetailSegueIdentifier sender:indexPath];
}

@end
