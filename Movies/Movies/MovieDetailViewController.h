//
//  MovieDetailViewController.h
//  Movies
//
//  Created by Guilherme Ferreira on 19/01/17.
//  Copyright © 2017 Guilherme Nunes Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MovieBusinessModel.h"

@interface MovieDetailViewController : UIViewController

@property (strong, nonatomic) MovieBusinessModel *movie;

@end
