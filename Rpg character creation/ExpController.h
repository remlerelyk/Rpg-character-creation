//
//  ExpController.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 3/17/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ExpController : UIViewController{
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UILabel *LvCount;
- (IBAction)weGoJump:(id)sender;

@end
