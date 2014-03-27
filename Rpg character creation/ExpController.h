//
//  ExpController.h
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 3/21/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ExpController : UIViewController
{
    AppDelegate * appDelegate;
}
- (IBAction)leaveView:(UIButton *)sender;
@property UIImageView * Frame,* exp;
@property NSString * iWin,* Win;
@property NSURL * audioURL,* audioSFX;

@end
