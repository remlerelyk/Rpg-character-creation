//
//  positiveMagicViewController.h
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 3/5/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface positiveMagicViewController : UIViewController
{
    AppDelegate * appDelegate;
}


@property (weak, nonatomic) IBOutlet UITextView *questionLabel;
- (IBAction)backButton:(UIButton *)sender;
@property (nonatomic, strong) NSString * magicType;
@end
