//
//  QuestionModel.h
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject



@property (strong, nonatomic) NSMutableArray *easyQuestions;
@property (strong, nonatomic) NSMutableArray *mediumQuestions;
@property (strong, nonatomic) NSMutableArray *hardQuestions;

-(NSMutableArray*)getQuestions:(QuizQuestionDifficulty)difficulty;



























@end
