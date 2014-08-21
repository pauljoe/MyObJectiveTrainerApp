//
//  QuestionClass.h
//  TrainerApp
//
//  Created by Paul Curran on 18/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionClass : NSObject



@property (nonatomic) QuizQuestionDifficulty questionDifficulty;
@property (nonatomic) QuizQuestionType questionType;
@property (strong, nonatomic) NSString *questionText;


//properties for MC
@property (strong, nonatomic) NSString *questionAnswer1;
@property (strong, nonatomic) NSString *questionAnswer2;
@property (strong, nonatomic) NSString *questionAnswer3;


//properties for fill in the blank
@property (strong, nonatomic) NSString *correctAnswerForBlank;


//properties for find within image
@property (nonatomic) int offset_x;
@property (nonatomic) int offset_y;
@property (nonatomic,strong) NSString *questionImageName;




@end
