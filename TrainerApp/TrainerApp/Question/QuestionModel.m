//
//  QuestionModel.m
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "QuestionModel.h"
#import "QuestionClass.h"

@implementation QuestionModel

-(id)init
{
    self = [super init];

    if(self)
    {
    //initialize stuff in here
    self.easyQuestions = [[NSMutableArray alloc]init];
    self.mediumQuestions = [[NSMutableArray alloc]init];
    self.hardQuestions = [[NSMutableArray alloc]init];
    }
    
    return self;
}


-(NSMutableArray*)getQuestions:(QuizQuestionDifficulty)difficulty
{
    //create some  Multiple choice easy questions
    QuestionClass *newQuestion = [[QuestionClass alloc]init];
    newQuestion.questionDifficulty = QuestionDifficultyEasy;
    newQuestion.questionType = QuestionTypeMC;
    newQuestion.questionText = @"This is a test question!";
    newQuestion.questionAnswer1 = @"Answer 1";
    newQuestion.questionAnswer2 = @"Answer 2";
    newQuestion.questionAnswer3 = @"Answer 3";
    
    [self.easyQuestions addObject:newQuestion];
    
    
    //create some QuestionTypeBlank easy questions
    QuestionClass *newBlankQuestion = [[QuestionClass alloc]init];
    newBlankQuestion.questionDifficulty = QuestionDifficultyEasy;
    newBlankQuestion.questionType = QuestionTypeBlank;
    newBlankQuestion.questionText = @"This is a blank type ________ question";
    newBlankQuestion.correctAnswerForBlank = @"This is the correct answer for blank";
    [self.easyQuestions addObject:newBlankQuestion];
    
    
    QuestionClass *newImageQuestion = [[QuestionClass alloc]init];
    newImageQuestion.questionDifficulty = QuestionDifficultyEasy;
    newImageQuestion.questionType = QuestionTypeImage;
    newImageQuestion.questionImageName = @"TestQuestionImage";
    newImageQuestion.offset_x = 50;
    newImageQuestion.offset_y = 50;
    [self.easyQuestions addObject:newImageQuestion];
    
    
    return self.easyQuestions;
    
    
}






@end
