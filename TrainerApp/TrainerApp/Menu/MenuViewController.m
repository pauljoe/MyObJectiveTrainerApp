//
//  MenuViewController.m
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
   // self.backgroundColor = [UIColor purpleColor];
    
    //set this viewController as the delegate for the tableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
    
    //fetch the menuItems

    self.menuItems = [[[MenuModel alloc]init]getMenuItems];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark TableView delegate methods


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //get the cell to be used
    
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //get the menu Item that it's asking for
    MenuItems *item = self.menuItems[indexPath.row];
    
    
    //set the text of the table view cells to the menu items text
    
    menuCell.textLabel.text = item.menuTitle;
    
    
    return menuCell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //check which item in the menu table was tapped
    //could use the the string to identify by title but use a netter way using Prefix.pch file
    
    MenuItems *item = self.menuItems[indexPath.row];   //very important you let computer know what the menu item is !
    
    switch (item.screenType) {
        case ScreenTypeQuestion:
            //go to Questions Screen
            [self performSegueWithIdentifier:@"GoToQuestionsSegue" sender:self];
            break;
            
        case ScreenTypeStats:
            //go to Stats screen
            [self performSegueWithIdentifier:@"GoToStatsSegue" sender:self];
            break;
            
        case ScreenTypeRemoveAds:
            //go to RemoveAds
            [self performSegueWithIdentifier:@"GoToRemoveAdsSegue" sender:self];
            break;
            
        case ScreenTypeAbout:
            //go to About screen
            [self performSegueWithIdentifier:@"GoToAboutSegue" sender:self];
            break;
            
            
        default:
            break;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //set the front view controller to be the destionation one
    
    [self.revealViewController setFrontViewController:segue.destinationViewController];
    
    
    //slide the front view controller back into place
    
    [self.revealViewController revealToggleAnimated:YES];
    
}











@end













































