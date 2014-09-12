//
//  ResultView.h
//  TrainerApp
//
//  Created by Paul Curran on 29/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionClass.h"


@protocol ResultViewProtocol <NSObject>

-(void) resultViewDismissed;

@end


@interface ResultView : UIView



@property (nonatomic, weak) id<ResultViewProtocol> delegate;


//label to display whether the answer choosen was correct or incorrect
@property (nonatomic,strong) UILabel *resultLabel;


//label to display user answer
@property (strong,nonatomic) UILabel *userAnswerLabel;

//label to display correct answer for text based questions
@property (strong , nonatomic) UILabel *correctAnswerLabel;


//Image view to display the correct answer image for image based questions
@property (strong, nonatomic) UIImageView *correctAnswerImageView;


//Button to continue
@property (nonatomic, strong) UIButton *continueButton;


-(void)showResultForTextQuestion:(BOOL)wasCorrect forUserAnswer:(NSString*)useranswer forQuestion:(QuestionClass*)question;

-(void) showresultForImageQuestion:(BOOL)wasCorrect forQuestion:(QuestionClass*)question;

@end
