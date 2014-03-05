//
//  positiveMagicViewController.m
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 3/5/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "positiveMagicViewController.h"

@interface positiveMagicViewController ()

@end

@implementation positiveMagicViewController

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
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
 //   [_questionLabel setText:[NSString stringWithFormat:@"Are you sure you want to use %@ magic?",  ]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
