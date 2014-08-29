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
        
        
    // load TrainerAppQuestions.json and parse out questions into arrays
        
        [self loadQuestions];
        
    }
    
    return self;
}


-(NSMutableArray*)getQuestions:(QuizQuestionDifficulty)difficulty
{
    if (difficulty == QuestionDifficultyEasy)
    {
        return self.easyQuestions;
    }
    else if (difficulty == QuestionDifficultyMedium)
    {
        return self.mediumQuestions;
    }
    else if (difficulty == QuestionDifficultyHard)
    {
        return self.hardQuestions;
    }
    else
    {
        //should not get into here
        return [[NSMutableArray alloc]init];
    }
    
    
}

-(void)loadQuestions
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"TrainerAppQuestions" ofType:@"json"];
    
    NSError *myError;
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&myError];
    
    NSData *myJsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *myJsonDictionary = [NSJSONSerialization JSONObjectWithData:myJsonData options:NSJSONReadingAllowFragments error:nil];
    
    
    //parse out easy questions
    NSArray *easyJsonArray = myJsonDictionary[@"easy"];
    self.easyQuestions = [self parseJsonArrayIntoQuestions:easyJsonArray forDifficulty:QuestionDifficultyEasy];
    
    //parse out medium questions
    NSArray *mediumJsonArray = myJsonDictionary[@"medium"];
    self.mediumQuestions = [self parseJsonArrayIntoQuestions:mediumJsonArray forDifficulty:QuestionDifficultyMedium];
    
    //parse out hard questions
    NSArray *hardJsonArray = myJsonDictionary[@"hard"];
    self.hardQuestions = [self parseJsonArrayIntoQuestions:hardJsonArray forDifficulty:QuestionDifficultyHard];
    
    
}


- (NSMutableArray*)parseJsonArrayIntoQuestions:(NSArray*)jsonArray forDifficulty:(QuizQuestionDifficulty)difficulty
{
    //create temporary array to store newly created questions
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    
    //Loop through objects in the passed in array
    for (int i = 0; i < jsonArray.count; i++)
    {
        //get the json object at this index
        NSDictionary *jsonObject = jsonArray[i];
        
        //create new question object
        QuestionClass *newQuestion = [[QuestionClass alloc]init];
        newQuestion.questionDifficulty = difficulty;
        
        if ([jsonObject[@"type"]isEqualToString:@"mc"])
        {
            //Parse out multiple choice type question
            newQuestion.questionType = QuestionTypeMC;
            newQuestion.questionText = jsonObject[@"question"];
            newQuestion.questionAnswer1 = jsonObject[@"answer0"];
            newQuestion.questionAnswer2 = jsonObject[@"answer1"];
            newQuestion.questionAnswer3 = jsonObject[@"answer2"];
            newQuestion.correctMCQuestionIndex = [jsonObject[@"correctanswer"]intValue];
        }
        else if ([jsonObject[@"type"]isEqualToString:@"image"])
        {
            //parse out image type questions
            newQuestion.questionType = QuestionTypeImage;
            newQuestion.questionImageName = jsonObject[@"imagename"];
            newQuestion.offset_x = [jsonObject[@"x_coord"] intValue];
            newQuestion.offset_y = [jsonObject[@"y_coord"] intValue];
            newQuestion.answerImageName = jsonObject[@"answerimage"];
            
        }
        else if ([jsonObject[@"type"]isEqualToString:@"blank"])
        {
            // parse out blank type questions
           
            newQuestion.questionType = QuestionTypeBlank;
            newQuestion.questionImageName = jsonObject[@"imagename"];
            newQuestion.answerImageName = jsonObject[@"answerimage"];
            newQuestion.correctAnswerForBlank = jsonObject[@"answer"];
            
        }
        
        
        // add newQuestion to tempArray
        [tempArray addObject:newQuestion];
        
        
        
        
        
        
        
    }
    
    return tempArray;
    
}



@end




























