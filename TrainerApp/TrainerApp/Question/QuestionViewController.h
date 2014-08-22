//
//  QuestionViewController.h
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
#import "QuestionClass.h"

@interface QuestionViewController : UIViewController


@property (strong,nonatomic) QuestionModel *model;
@property (strong,nonatomic) NSArray *questions;

@property (nonatomic) QuizQuestionDifficulty questionDifficulty;
@property (strong, nonatomic) IBOutlet UIScrollView *questionScrollView;


//properties for ui elements

@property (strong, nonatomic) IBOutlet UILabel *questionText;

@property (strong, nonatomic) IBOutlet UIButton *questionMCAnswer1;
@property (strong, nonatomic) IBOutlet UIButton *questionMCAnswer2;
@property (strong, nonatomic) IBOutlet UIButton *questionMCAnswer3;



//properties for fillin the blank questions

@property (strong, nonatomic) IBOutlet UIButton *submitAnswerForBlankButton;
@property (strong, nonatomic) IBOutlet UITextField *blankTextField;
@property (strong, nonatomic) IBOutlet UILabel *instructionLabelForBlank;



//properties for image type questions

@property (strong, nonatomic) IBOutlet UIImageView *imageQuestionImageView;
@property (strong, nonatomic) IBOutlet UIButton *skipButton;


@end
