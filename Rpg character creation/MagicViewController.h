//
//  MagicViewController.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 2/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewControllerMain.h"
@interface MagicViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate * appdelegate;
}
@property (nonatomic, strong) IBOutlet UITableView * magicTable;
@property (nonatomic, strong) IBOutlet UILabel * manaLabel;
@property NSMutableArray * magicArray;
@property int currentMagic;
@property int totalMagic;
@property int totalHealth;
@property int currentHealth;
@end
