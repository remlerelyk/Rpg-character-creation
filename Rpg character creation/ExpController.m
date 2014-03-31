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

//working on the level up view controller touch ups


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
        appDelegate.isLeft = TRUE;
    _exp = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 1, 16)];
    [self.view addSubview:_exp];
    _Frame = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 280, 16)];
    [self.view addSubview:_Frame];
    [super viewDidLoad];
    NSLog(@"Exp %i",value);
    [_exp setImage:[UIImage imageNamed:@"exp.gif"]];
    [_Frame setImage:[UIImage imageNamed:@"Frame.gif"]];
	// Do any additional setup after loading the view.
    [self animation];

    _iWin =[[NSBundle mainBundle] pathForResource:@"iWin" ofType:@"mp3"];
    _Win =[[NSBundle mainBundle] pathForResource:@"Win" ofType:@"mp3"];
    _audioURL = [NSURL fileURLWithPath:_iWin];
    [appDelegate.music stop];
    appDelegate.music =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioURL error:nil];
    [appDelegate.music play];
    [self performSelector:@selector(playRest) withObject:self afterDelay:15.2145f];


    
    [_statDescribeLabel setText:@""];
    [_descriptionTextView setText:@""];
    [_levelUpLabel setText:@""];
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];


}
- (void)animation{
    float i = appDelegate.Player.expLvUP;
    float o = appDelegate.Player.exp;
    float temp = o/i;
    temp = temp*280;
   
    if (temp==0) {
        temp=280;
    }
    [UIView animateWithDuration:2.0f animations:^{
        _exp.frame=CGRectMake(16, 16, appDelegate.lastValue, 16);
        _exp.frame=CGRectMake(16, 16, temp, 16);
    }completion:^(BOOL fin){
         appDelegate.lastValue = temp;
        if (temp==280) {
           _exp.frame=CGRectMake(16, 16, 1, 16);
            appDelegate.lastValue = 1;
            [_levelUpLabel setText:@"Level UP!!!"];
        }
        [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    }
     ];
    
    /*
    if(appDelegate.BarProgress){
    [UIView animateWithDuration:2.0f animations:^{
            _exp.frame =CGRectMake(16, 16, appDelegate.BarProgress, 16);
            _exp.frame =CGRectMake(16, 16, 280, 16);
            appDelegate.BarProgress=0;
        
        }
                     completion:^(BOOL finished)
        {
            if( finished)
            {
                 [_levelUpLabel setText:@"Level UP!!!"];
               [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
                _exp.frame =CGRectMake(16, 16, 1, 16);
            }
        }
     ];
        //we need to fix on monday
                appDelegate.expLvl = appDelegate.Player.lvl;
        if (appDelegate.expLvl <= [appDelegate.Player expLvUP]){
            
            
        }
    }else if (appDelegate.Player.lvl!=appDelegate.expLvl) {
        
        [UIView animateWithDuration:2.0f animations:^{
            _exp.frame =CGRectMake(16, 16, 1, 16);
            _exp.frame =CGRectMake(16, 16, 280, 16);
            
        }completion:^(BOOL Done){if (Done){
           
            _exp.frame =CGRectMake(16, 16, 1, 16);
            [_levelUpLabel setText:@"Level UP!!!"];
            [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
            
                    }}
         ];
        appDelegate.expLvl++;
        if (appDelegate.expLvl<=[appDelegate.Player expLvUP]){
        [self performSelector:@selector(animation) withObject:self afterDelay:2.1f];
        
        }
    }else{
            [UIView animateWithDuration:2.0f animations:^{
            _exp.frame =CGRectMake(16, 16, 1, 16);
            _exp.frame =CGRectMake(16, 16, temp, 16);
            appDelegate.BarProgress=temp;
                
            }completion:^(BOOL finished)
        {
                if(finished)
                {
                    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
                }
            }];
    }
     */
}
// All of the button actions
- (IBAction)magicMinusButton:(UIButton *)sender
{
    if([appDelegate.Player magic] >1)
    {
        [appDelegate.Player setMagic:[appDelegate.Player magic]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells."];
    [appDelegate.Player cleanStats];
}

- (IBAction)magicPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setMagic:[appDelegate.Player magic]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];;
    }
    [_magicLabel setText:[NSString stringWithFormat:@"Int: %i", [appDelegate.Player magic]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much MP or magic points you have. It also Increases damage done by spells. When you're MP reaches 0 you can no longer cast any spells, and you must either level up or use a mana potion to restore it."];
    [appDelegate.Player cleanStats];
}
- (IBAction)strengthMinusButton:(UIButton *)sender
{
    if([appDelegate.Player strength] > 1)
    {
        [appDelegate.Player setStrength:[appDelegate.Player strength]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
    [appDelegate.Player cleanStats];
}

- (IBAction)strengthPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setStrength:[appDelegate.Player strength]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_strengthLabel setText:[NSString stringWithFormat:@"Str: %i", [appDelegate.Player strength]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much damage you deal with weapons"];
    [appDelegate.Player cleanStats];
}

- (IBAction)dexterityMinusButton:(UIButton *)sender
{
    if([appDelegate.Player dexterity] > 1)
    {
        [appDelegate.Player setDexterity:[appDelegate.Player dexterity]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
    [appDelegate.Player cleanStats];
}

- (IBAction)dexterityPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setDexterity:[appDelegate.Player dexterity]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_dexterityLabel setText:[NSString stringWithFormat:@"Dex: %i", [appDelegate.Player dexterity]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects who goes first in the combat phase, it also affects your critical hit chance."];
    [appDelegate.Player cleanStats];
}

- (IBAction)healthMinusButton:(UIButton *)sender
{
    if([appDelegate.Player health] > 1)
    {
        [appDelegate.Player setHealth:[appDelegate.Player health]-1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]+1];
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
    [appDelegate.Player cleanStats];
}




-(void)playRest{
    if(appDelegate.isLeft){
    _audioURL = [NSURL fileURLWithPath:_Win];
    [appDelegate.music stop];
    appDelegate.music =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioURL error:nil];
    [appDelegate.music play];
    appDelegate.isMusic = TRUE;
    appDelegate.music.numberOfLoops = -1;
    }
}
- (IBAction)healthPositiveButton:(UIButton *)sender
{
    if([appDelegate.Player totalStats] > 0)
    {
        [appDelegate.Player setHealth:[appDelegate.Player health]+1];
        [appDelegate.Player setTotalStats:[appDelegate.Player totalStats]-1];
    }
    [_healthLabel setText:[NSString stringWithFormat:@"Con: %i", [appDelegate.Player health]]];
    [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
    [_descriptionTextView setText:@"This stat affects how much health you have, when you're health reaches 0 you lose, use a health potion or level up to restore your health."];
    [appDelegate.Player cleanStats];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)leaveView:(UIButton *)sender {
    appDelegate.isLeft = FALSE;
    appDelegate.isMusic = TRUE;
}
@end
