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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (nonatomic, strong) NSArray<MovieBusinessModel *> *moviesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesArray = [[NSArray alloc] init];
    self.moviesArray = [MovieBusinessObject getAllMoviesToShow];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)navigationBarRightButtonAction:(id)sender {
    
    InsertMovieViewController *insertMoviewViewController = [[InsertMovieViewController alloc] initWithNibName:@"InsertMovieViewController" bundle:nil];
    [insertMoviewViewController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:insertMoviewViewController animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moviesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    MovieBusinessModel *movie = [self.moviesArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:movie.title];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end
