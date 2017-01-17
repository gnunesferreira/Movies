//
//  InsertMovieViewController.m
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "InsertMovieViewController.h"
#import "MoviesManager.h"

#import "ColorConstants.h"

@interface InsertMovieViewController ()

//feedbackView
@property (weak, nonatomic) IBOutlet UIView *feedbackView;
@property (weak, nonatomic) IBOutlet UIImageView *feedbackImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedbackActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;

@end

@implementation InsertMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[ColorConstants insertMoviwViewControllerBackgroundColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)lazyDismiss {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark - IBAction

- (IBAction)backgroundButtonAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelAction:(id)sender {

}

- (IBAction)inserAction:(id)sender {
    
    [self startLoadingWithText:@"Loading"];
    
    [[MoviesManager sharedInstance] insertMovieWithSuccessCompletionNotification:^{
        
#warning success image
        [self showStatusWithImage:nil withText:@"Success to insert movie"];
    } withFailureCompletionNotification:^(NSError *error) {
        
#warning failure image
        [self showStatusWithImage:nil withText:@"Failure to insert movie"];
    }];
}

#pragma mark - Public Methods

- (void)startLoadingWithText:(NSString *)text {
    
    [self.feedbackActivityIndicator startAnimating];
    [self.feedbackActivityIndicator setHidden:NO];
    
    [self.feedbackImageView setHidden:YES];
    
    [self showFeedbackText:text];
}

- (void)showStatusWithImage:(UIImage *)image withText:(NSString *)text {
    
    [self.feedbackImageView stopAnimating];
    [self.feedbackActivityIndicator setHidden:YES];
    
    [self.feedbackImageView setHidden:NO];
    
    [self showFeedbackText:text];
}

#pragma mark - Private Methods

- (void)showFeedbackText:(NSString *)text {
    
    if (text) {
        [self.feedbackLabel setHidden:NO];
        [self.feedbackLabel setText:text];
    }
    else {
        [self.feedbackLabel setHidden:YES];
    }
}


@end
