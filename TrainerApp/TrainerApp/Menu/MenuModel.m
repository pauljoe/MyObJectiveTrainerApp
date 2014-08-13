//
//  MenuModel.m
//  TrainerApp
//
//  Created by Paul Curran on 08/08/2014.
//  Copyright (c) 2014 Paul Curran. All rights reserved.
//

#import "MenuModel.h"
#import "MenuItems.h"

@implementation MenuModel

-(NSArray*)getMenuItems
{
    NSMutableArray *menuItemArray = [[NSMutableArray alloc]init];
    
    
    MenuItems *item1 = [[MenuItems alloc]init];
    item1.menuTitle = @"Easy Questions";
    [menuItemArray addObject:item1];
    
    MenuItems *item2 = [[MenuItems alloc]init];
    item2.menuTitle = @"Medium Questions";
    [menuItemArray addObject:item2];
    
    
    MenuItems *item3 = [[MenuItems alloc]init];
    item3.menuTitle = @"Hard Questions";
    [menuItemArray addObject:item3];
    
    MenuItems *item4 = [[MenuItems alloc]init];
    item4.menuTitle = @"Statistics";
    [menuItemArray addObject:item4];
    
    MenuItems *item5 = [[MenuItems alloc]init];
    item5.menuTitle = @"About";
    [menuItemArray addObject:item5];
    
    
    MenuItems *item6 = [[MenuItems alloc]init];
    item6.menuTitle = @"Remove Ads";
    [menuItemArray addObject:item6];
    

    
    
    
    return menuItemArray;
    
}










@end
