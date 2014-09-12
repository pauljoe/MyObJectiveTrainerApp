//
//  ResultView.m
//  TrainerApp
//
//  Created by Paul Curran on 29/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "ResultView.h"

@implementation ResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 50, 200, 50)];
        self.resultLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.resultLabel];
        
        
        self.userAnswerLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 120, 200, 100)];
        self.userAnswerLabel.numberOfLines = 0;
        self.userAnswerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.userAnswerLabel];
        
        self.correctAnswerLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 240, 200, 100)];
        self.correctAnswerLabel.numberOfLines = 0;
        self.correctAnswerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.correctAnswerLabel];
        
        self.correctAnswerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 120, 300, 200)];
        [self addSubview:self.correctAnswerImageView];
        
        self.continueButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.continueButton.frame = CGRectMake(85, 350, 150, 50);
        [self.continueButton setTitle:@"Continue" forState:UIControlStateNormal];
        [self.continueButton addTarget:self action:@selector(continueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.continueButton];
        
        self.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}

-(void)hideAllElements
{
    self.resultLabel.hidden = YES;
    self.userAnswerLabel.hidden = YES;
    self.correctAnswerLabel.hidden = YES;
    self.correctAnswerImageView.hidden = YES;
    self.continueButton.hidden = YES;
    
}


-(void)showResultForTextQuestion:(BOOL)wasCorrect forUserAnswer:(NSString*)useranswer forQuestion:(QuestionClass*)question
{
    //hide all elements
    [self hideAllElements];
    
    
    //set and show label if user was correct or not
    
    self.resultLabel.text = wasCorrect ? @"Correct!" : @"Incorrect";
    self.resultLabel.hidden = NO;
    
    self.userAnswerLabel.text = [NSString stringWithFormat:@"Your answer was:\n %@", useranswer];
    self.userAnswerLabel.hidden = NO;
    
    
    NSString *correctAnswerString = @"";
    
    switch (question.correctMCQuestionIndex)
    {
        case 1:
            correctAnswerString = question.questionAnswer1;
            break;
        case 2:
            correctAnswerString = question.questionAnswer2;
            break;
        case 3:
            correctAnswerString= question.questionAnswer3;
            break;
            
        default:
            break;
    }
    
    self.correctAnswerLabel.text = [NSString stringWithFormat:@"Correct answer was:\n %@", correctAnswerString];
    self.correctAnswerLabel.hidden = NO;
    
    self.continueButton.hidden = NO;
}






-(void) showresultForImageQuestion:(BOOL)wasCorrect forQuestion:(QuestionClass*)question
{
    
    //hide all elements
    [self hideAllElements];
    
    
    //set and show label if user was corect or not
    
    self.resultLabel.text = wasCorrect ? @"Correct!" : @"Incorrect";
    self.resultLabel.hidden = NO;
    
    //set and show correct answer image
    
    UIImage *tempImage = [UIImage imageNamed:question.answerImageName];
    self.correctAnswerImageView.image = tempImage;
    
    
    //get aspect ratio of image
    double aspect = tempImage.size.height /tempImage.size.width;
    
    
    //resize imageview
    CGRect imageViewFrame = self.correctAnswerImageView.frame;
    imageViewFrame.size.width = self.frame.size.width - 20;
    imageViewFrame.size.height = imageViewFrame.size.width * aspect;
    self.correctAnswerImageView.frame = imageViewFrame;
    
    self.correctAnswerImageView.hidden = NO;
    
    
    //position the button below the image view
    CGRect buttonFrame = self.continueButton.frame;
    buttonFrame.origin.y = self.correctAnswerImageView.frame.origin.y + self.correctAnswerImageView.frame.size.height + 30;
    self.continueButton.frame = buttonFrame;
    
    //show button
    self.continueButton.hidden = NO;
    
    
}




-(void)continueButtonClicked
{
    //notify delegate that result view can be dismissed
    
    [self.delegate resultViewDismissed];
}



@end















