//
//  StatsViewController.h
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *totalQuestionsLabel;
@property (strong, nonatomic) IBOutlet UILabel *easyQuestionStats;
@property (strong, nonatomic) IBOutlet UILabel *mediumQuestionStats;
@property (strong, nonatomic) IBOutlet UILabel *hardQuestionStats;

@end
