//
//  MenuViewController.h
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuModel.h"
#import "MenuItems.h"

@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>




@property (strong, nonatomic) MenuModel *model;
@property (strong, nonatomic) NSArray *menuItems;





@property (weak, nonatomic) IBOutlet UITableView *tableView;




@end
