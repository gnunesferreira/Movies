//
//  ViewController.m
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "ViewController.h"

#import "InsertMovieViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
