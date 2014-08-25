//
//  QuestionViewController.m
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "QuestionViewController.h"
#import "SWRevealViewController.h"

@interface QuestionViewController ()
{
    QuestionClass *_currentQuestion;
    UIView *_tappablePortionOfTheImageQuestion;
    UITapGestureRecognizer *_tapRecognizer;
    UITapGestureRecognizer *_scrollViewTapGestureRecognizer;
}


@end

@implementation QuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //add tap gesture recognizer to scroll view
    
    
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    
    
    _scrollViewTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTapped)];
    [self.questionScrollView addGestureRecognizer:_scrollViewTapGestureRecognizer];
    
    
    
    
    
    
    
    
    
    
    //hide all the question elements
    [self hideAllQuestionElements];
    
    
    //create the quiz model
    
    self.model = [[QuestionModel alloc]init];
    
    //check difficulty level and retrieve questions for desired level
    self.questions = [self.model getQuestions:self.questionDifficulty];
    
    
    
    
    [self randomizeQuestionForDisplay];

    
  /*  //randomize a question
    int randomQuestionIndex = arc4random() % self.questions.count;
    _currentQuestion = self.questions[randomQuestionIndex];
    
    //display the question
    [self displayCurrentQuestion];
   */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//this is a helper method to hide the ui elements in the view

-(void) hideAllQuestionElements
{
    self.questionText.hidden = YES;
    self.questionMCAnswer1.hidden = YES;
    self.questionMCAnswer2.hidden = YES;
    self.questionMCAnswer3.hidden = YES;
    self.submitAnswerForBlankButton.hidden = YES;
    self.blankTextField.hidden = YES;
    self.instructionLabelForBlank.hidden = YES;
    self.imageQuestionImageView.hidden = YES;
    
    
    //remove the tappable uiview for the image questions
    if (_tappablePortionOfTheImageQuestion.superview != nil)
    {
        [_tappablePortionOfTheImageQuestion removeFromSuperview];
    }
    
}


#pragma mark Question methods

-(void) displayCurrentQuestion
{
    switch (_currentQuestion.questionType) {
        case QuestionTypeMC:
            [self displayMCQuestion];
            break;
            
        case QuestionTypeBlank:
            [self displayBlankQuestion];
            break;
            
        case QuestionTypeImage:
            [self displayImageQuestion];
            break;
            
        default:
            break;
    }
}


-(void)displayMCQuestion
{
    //hide the question elements
    [self hideAllQuestionElements];
    
    //set the question elements
    
    self.questionText.text = _currentQuestion.questionText;
    [self.questionMCAnswer1 setTitle:_currentQuestion.questionAnswer1 forState:UIControlStateNormal];
    [self.questionMCAnswer2 setTitle:_currentQuestion.questionAnswer2 forState:UIControlStateNormal];
    [self.questionMCAnswer3 setTitle:_currentQuestion.questionAnswer3 forState:UIControlStateNormal];
    
    //adjust the scroll view 3.5 inch screen and 4 inch screens
    
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
    
    
    
    //reveal the question elements
    
    self.questionText.hidden = NO;
    self.questionMCAnswer1.hidden = NO;
    self.questionMCAnswer2.hidden = NO;
    self.questionMCAnswer3.hidden = NO;
    
    
}

-(void)displayImageQuestion
{
    [self hideAllQuestionElements];
    
    
    //set question elements
    
    
    //TODO: set Image
    self.imageQuestionImageView.backgroundColor = [UIColor greenColor];
    
   //create tappable part
    int tappable_x = self.imageQuestionImageView.frame.origin.x + _currentQuestion.offset_x - 10;
    int tappable_y = self.imageQuestionImageView.frame.origin.y + _currentQuestion.offset_x - 10;
    
    _tappablePortionOfTheImageQuestion = [[UIView alloc]initWithFrame:CGRectMake(tappable_x, tappable_y, 20, 20)];
    _tappablePortionOfTheImageQuestion.backgroundColor = [UIColor redColor];
    
    
    //create and attach gesture recognizer
    _tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageQuestionAnswered)];
    [_tappablePortionOfTheImageQuestion addGestureRecognizer:_tapRecognizer];
    
    
    
    
    [self.questionScrollView addSubview:_tappablePortionOfTheImageQuestion];  // add it to the view
    
    self.imageQuestionImageView.hidden = NO;
    
    
    
    
    
    
    
}

-(void)displayBlankQuestion
{
    [self hideAllQuestionElements];
    
    
    //set the question elements
    
    self.questionText.text = _currentQuestion.questionText;
    
    
    
    
    
    
    
    //adjust the scroll view 3.5 inch screen and 4 inch screens
    
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
    
    
    
    //reveal the question elements
    
    self.questionText.hidden = NO;
    self.submitAnswerForBlankButton.hidden = NO;
    self.blankTextField.hidden = NO;
    self.instructionLabelForBlank.hidden = NO;
    
   
    
}



-(void)randomizeQuestionForDisplay
{
    //randomize a question
    int randomQuestionIndex = arc4random() % self.questions.count;
    _currentQuestion = self.questions[randomQuestionIndex];
    
    //display the question
    [self displayCurrentQuestion];
    

}


















#pragma mark Question Answer Handlers


-(IBAction)skipButtonClicked:(id)sender
{
    //randomize and display another question
    [self randomizeQuestionForDisplay];
}













      //when user answers a MC question

-(IBAction)questionMCAnswer:(id)sender
{
    
    
    BOOL isCorrect = NO;
    
    UIButton *selectedButton = (UIButton *)sender;
    
    if (selectedButton.tag == _currentQuestion.correctMCQuestionIndex)
    {
        //user got it right
        isCorrect = YES;
        
        
        //TODO: display message for correct answer
    }
    else
    {
        //user got it wrong
    }
    
    
    //save the question data
    
    [self saveQuestionData:_currentQuestion.questionType withDifficulty:_currentQuestion.questionDifficulty isCorrect:isCorrect];
    
    //go to next question
    [self randomizeQuestionForDisplay];
    
}

  //when user answers an image question by tapping on the screen

-(void)imageQuestionAnswered
{
    //user got it right
    
    
  
    
    
    
    
    [self saveQuestionData:_currentQuestion.questionType withDifficulty:_currentQuestion.questionDifficulty isCorrect:YES];
    
    //go to the next question
    [self randomizeQuestionForDisplay];
    
}



    // when the user answers a fill in the blank type question
-(IBAction)blankSubmitted:(id)sender
{
    NSString *answer = self.blankTextField.text;
    BOOL isCorrect = NO;
    
    
    
    
    if ([answer isEqualToString:_currentQuestion.correctAnswerForBlank])
    {
        isCorrect = YES;
        
        //user got it right
        
        
        //TODO: display message for correct answer
    }
    else
    {
        //user got it wrong
    }
    
   //record question Data
    
    [self saveQuestionData:_currentQuestion.questionType withDifficulty:_currentQuestion.questionDifficulty isCorrect:isCorrect];
    
    
    
    //go to tne next question
    [self randomizeQuestionForDisplay];

}


// save the data for use in the stats view questionType, difficulty, if correct or not

-(void)saveQuestionData:(QuizQuestionType)type withDifficulty:(QuizQuestionDifficulty)difficulty isCorrect:(BOOL)correct
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *keyToSaveForType = @"";
    
    if (type == QuestionTypeBlank)
    {
       keyToSaveForType = @"Blank";
        
    }
    else if (type == QuestionTypeMC)
    {
       
      keyToSaveForType = @"MC";
    }
    
    else if (type == QuestionTypeImage)
    {
      keyToSaveForType = @"Image";
        
    }


        //record that they answered a question of type
    int questionsAnsweredByType = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionsAnswered",keyToSaveForType]];
    questionsAnsweredByType++;
    [userDefaults setInteger:questionsAnsweredByType forKey:[NSString stringWithFormat:@"%@QuestionsAnswered",keyToSaveForType]];



        //record that they answered a question of type correctly
    int questionsAnsweredCorrectlyByType = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionsAnsweredCorrectly",keyToSaveForType]];
    questionsAnsweredCorrectlyByType++;
    [userDefaults setInteger:questionsAnsweredCorrectlyByType forKey:[NSString stringWithFormat:@"%@QuestionsAnsweredCorrectly",keyToSaveForType]];






    //now we record the number of questions answered as per Question difficulty
    
    
    NSString *keyToSaveForDifficulty = @"";
    
    if (difficulty == QuestionDifficultyEasy)
    {
        keyToSaveForDifficulty = @"Easy";
        
    }
    
    else if (difficulty == QuestionDifficultyMedium)
    {
        keyToSaveForDifficulty = @"Medium";
    }
    
    else if (difficulty == QuestionDifficultyHard)
    {
        keyToSaveForDifficulty = @"Hard";
    }
    
    
    //record the questions answered by difficulty
    
    int questionAnsweredWithDifficulty = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionsAnswered",keyToSaveForDifficulty]];
    questionAnsweredWithDifficulty++;
    [userDefaults setInteger:questionAnsweredWithDifficulty forKey:[NSString stringWithFormat:@"%@QuestionsAnswered",keyToSaveForDifficulty]];
    
    //record the questions answered correctly by difficulty
    
    if (correct)  
    {
        int questionAnsweredCorrectlyWithDifficulty = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionAnsweredCorrectly",keyToSaveForDifficulty]];
        questionAnsweredCorrectlyWithDifficulty++;
        [userDefaults setInteger:questionAnsweredCorrectlyWithDifficulty forKey:[NSString stringWithFormat:@"%@QuestionAnsweredCorrectly",keyToSaveForDifficulty]];
    }
    

    
    
    
    
    
    
    
    
    
    
    [userDefaults synchronize];
}




-(void)scrollViewTapped
{
    [self.blankTextField resignFirstResponder];
}



@end






































