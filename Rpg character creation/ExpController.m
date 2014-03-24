//
//  ExpController.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 3/21/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "ExpController.h"

@interface ExpController ()

@end

@implementation ExpController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//[UIImage imageNamed:@"exp.gif"]
//[UIImage imageNamed:@"Frame.gif"]
//Bar is 264px 
- (void)viewDidLoad
{
    int value = 0;
    appDelegate = [[UIApplication sharedApplication] delegate];
    _exp = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 1, 16)];
    [self.view addSubview:_exp];
    _Frame = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 280, 16)];
    [self.view addSubview:_Frame];
    [super viewDidLoad];
    NSLog(@"Exp %i",value);
    [_exp setImage:[UIImage imageNamed:@"exp.gif"]];
    [_Frame setImage:[UIImage imageNamed:@"Frame.gif"]];
	// Do any additional setup after loading the view.
    while ([appDelegate.Player lvl]>=appDelegate.expLvl) {
    [UIView animateWithDuration:2.0f animations:^{
       _exp.frame =CGRectMake(16, 16, 1, 16);
        _exp.frame =CGRectMake(16, 16, 280, 16);
    }completion:^(BOOL Done){if (Done){
        _exp.frame =CGRectMake(16, 16, 1, 16);
    }}
     ];
        appDelegate.expLvl++;
     }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
