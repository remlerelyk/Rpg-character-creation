//
//  OverdriveViewController.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 3/17/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerMain.h"
@interface OverdriveViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate * appDelegate;
}
@property (nonatomic, strong) IBOutlet UITableView * overdriveTable;
@property (nonatomic, strong) IBOutlet UILabel * overdriveLabel;
@property (nonatomic, strong) NSString * overdriveType;
@property NSMutableArray * overdriveArray;
@end
