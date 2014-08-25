//
//  StatsViewController.m
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "StatsViewController.h"
#import "SWRevealViewController.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

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
    
    
    //add pan gesture recognizer for revealing the menu
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //Load and display Stats
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //easy stats
    int easyQuestionsAnswered = [userDefaults integerForKey:@"EasyQuestionsAnswered"];
    int easyQuestionsCorrect = [userDefaults integerForKey:@"EasyQuestionsAnsweredCorrectly"];
    self.easyQuestionStats.text = [NSString stringWithFormat:@"Easy Questions: %i/%i",easyQuestionsCorrect,easyQuestionsAnswered];
    
    //medium stats
    int mediumQuestionsAnswered = [userDefaults integerForKey:@"MediumQuestionsAnswered"];
    int mediumQuestionionsCorrect = [userDefaults integerForKey:@"MediumQuestionsAnsweredCorrectly"];
    self.mediumQuestionStats.text = [NSString stringWithFormat:@"Medium Questions: %i/%i", mediumQuestionionsCorrect,mediumQuestionsAnswered];
    
    //hard question stats
    int hardQuestionsAnswered = [userDefaults integerForKey:@"HardQuestionsAnswered"];
    int hardQuestionsCorrect = [userDefaults integerForKey:@"HardQuestionsAnsweredCorrectly"];
    self.hardQuestionStats.text = [NSString stringWithFormat:@"Hard Questions: %i/%i",hardQuestionsCorrect,hardQuestionsAnswered];//total
    
    //total questions label
    self.totalQuestionsLabel.text = [NSString stringWithFormat:@"Total Questions Answered:%i", easyQuestionsAnswered + mediumQuestionsAnswered + hardQuestionsAnswered];
    
    
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

@end
