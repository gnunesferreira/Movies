//
//  InsertMovieViewController.h
//  Movies
//
//  Created by Guilherme Nunes Ferreira on 16/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^kCloseCompletion)(void);

@interface InsertMovieViewController : UIViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withCloseCompletion:(kCloseCompletion)closeCompletion;

@end
