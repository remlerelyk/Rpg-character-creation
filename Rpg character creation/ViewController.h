//
//  ViewController.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ViewController : UIViewController{
       AppDelegate *appDelegate;
    }
@property (weak, nonatomic) IBOutlet UILabel *statDescribeLabel;

@end
