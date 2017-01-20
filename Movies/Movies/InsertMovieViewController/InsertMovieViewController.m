//
//  InsertMovieViewController.m
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import "InsertMovieViewController.h"

#import "ColorConstants.h"
#import "MovieBusinessObject.h"

@interface InsertMovieViewController ()

//feedbackView
@property (weak, nonatomic) IBOutlet UIView *feedbackView;
@property (weak, nonatomic) IBOutlet UIImageView *feedbackImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedbackActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;

@property (weak, nonatomic) IBOutlet UITextField *movieNameTextField;

@property (copy, nonatomic) kCloseCompletion closeCompletion;
@end

@implementation InsertMovieViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withCloseCompletion:(kCloseCompletion)closeCompletion {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.closeCompletion = closeCompletion;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[ColorConstants insertMoviwViewControllerBackgroundColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)lazyDismiss {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.closeCompletion) {
            self.closeCompletion();
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark - IBAction

- (IBAction)backgroundButtonAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)inserAction:(id)sender {
    
    [self startLoadingWithText:@"Loading"];
    
    [MovieBusinessObject insertMovieWithName:self.movieNameTextField.text
                      withSuccessCompletionNotification:^{

                          [self showStatusWithImage:[UIImage imageNamed:@"check"] withText:@"Success to insert movie"];
                          [self lazyDismiss];
                      }
                      withFailureCompletionNotification:^(NSError *error) {
        
                          [self lazyDismiss];
                          
                          NSString *errorMessage = error.code == 1000 ? @"Duplicated movie" : @"Failure to localize movie";
                          [self showStatusWithImage:[UIImage imageNamed:@"error"] withText:errorMessage];
    }];
}

#pragma mark - Public Methods

- (void)startLoadingWithText:(NSString *)text {
    
    [self.feedbackView setHidden:NO];
    [self.feedbackView setAlpha:1.0];
    
    [self.feedbackActivityIndicator startAnimating];
    [self.feedbackActivityIndicator setHidden:NO];
    
    [self.feedbackImageView setHidden:YES];
    
    [self showFeedbackText:text];
}

- (void)showStatusWithImage:(UIImage *)image withText:(NSString *)text {
    
    [self.feedbackView setAlpha:1.0];
    [self.feedbackView setHidden:NO];
    
    [self.feedbackImageView stopAnimating];
    [self.feedbackActivityIndicator setHidden:YES];
    
    [self.feedbackImageView setHidden:NO];
    [self.feedbackImageView setImage:image];
    
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
