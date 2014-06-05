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

    //int value = 0;
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    [appDelegate.Player levelUp];
        appDelegate.isLeft = TRUE;
    _exp = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 1, 16)];
    [self.view addSubview:_exp];
    _Frame = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 280, 16)];
    [self.view addSubview:_Frame];
    [super viewDidLoad];
   // NSLog(@"Exp %i",value);
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

    [_labelNewAbility setText:@""];
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
             [_statDescribeLabel setText:[NSString stringWithFormat:@"You have %i stat points left", [appDelegate.Player totalStats]]];
            switch (appDelegate.Player.lvl)
            {
                
                case 43:
                    [_labelNewAbility setText:@"Learned SheerVoltabalu"];
                     break;
                case 40:
                    [_labelNewAbility setText:@"Learned Dance of the Nine Swords"];
                    break;
                case 38:
                    [_labelNewAbility setText:@"Learned Sheer Ice"];
                     break;
                
                case 34:
                    [_labelNewAbility setText:@"Learned Voltunder"];
                    break;
                case 30:
                    [_labelNewAbility setText:@"Learned Between the eyes"];
                    break;
                case 29:
                    [_labelNewAbility setText:@"Learned Cracure"];
                     break;
                
                case 24:
                    [_labelNewAbility setText:@"Learned Balufire"];
                     break;
                case 20:
                    [_labelNewAbility setText:@"Learned Jabbing the Abdomen"];
                    break;
                case 19:
                    [_labelNewAbility setText:@"Learned Baice"];
                     break;
                case 16:
                    [_labelNewAbility setText:@"Learned Bathunder"];
                     break;
                case 15:
                    [_labelNewAbility setText:@"Learned Smoltering Blade"];
                    break;
                case 13:
                    [_labelNewAbility setText:@"Learned Bacure"];
                     break;
                case 11:
                    [_labelNewAbility setText:@"Learned Tri-Magic"];
                    break;
                case 10:
                    [_labelNewAbility setText:@"Learned Bafire and MultiSlash"];
                     break;
                case 6:
                    [_labelNewAbility setText:@"Learned MultiSlash"];
                    break;
                case 7:
                    [_labelNewAbility setText:@"Learned Ice"];
                     break;
                case 5:
                    [_labelNewAbility setText:@"Learned Thunder"];
                     break;
                case 3:
                    [_labelNewAbility setText:@"Learned Fire"];
                    break;
                case 2:
                    [_labelNewAbility setText:@"Learned Cure"];
                    break;
                default:
                    break;
            }
        
            
        }
    
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

    if(appDelegate.Player.lvlUp == FALSE)
    {
        [_strengthMinus setAlpha:0];
        [_strengthPlus setAlpha:0];
        [_conMinus setAlpha:0];
        [_conPlus setAlpha:0];
        [_intMinus setAlpha:0];
        [_intPlus setAlpha:0];
        [_dexMinus setAlpha:0];
        [_dexPlus setAlpha:0];
        
        [_strengthMinus setUserInteractionEnabled:FALSE];
        [_strengthPlus setUserInteractionEnabled:FALSE];
        [_conPlus setUserInteractionEnabled:FALSE];
        [_conMinus setUserInteractionEnabled:FALSE];
        [_dexMinus setUserInteractionEnabled:FALSE];
        [_dexPlus setUserInteractionEnabled:FALSE];
        [_intMinus setUserInteractionEnabled:FALSE];
        [_intPlus setUserInteractionEnabled:FALSE];
    }
    if(appDelegate.Player.lvlUp == TRUE)
    {
        [_strengthMinus setAlpha:1];
        [_strengthPlus setAlpha:1];
        [_conMinus setAlpha:1];
        [_conPlus setAlpha:1];
        [_intMinus setAlpha:1];
        [_intPlus setAlpha:1];
        [_dexMinus setAlpha:1];
        [_dexPlus setAlpha:1];
        
        [_strengthMinus setUserInteractionEnabled:TRUE];
        [_strengthPlus setUserInteractionEnabled:TRUE];
        [_conPlus setUserInteractionEnabled:TRUE];
        [_conMinus setUserInteractionEnabled:TRUE];
        [_dexMinus setUserInteractionEnabled:TRUE];
        [_dexPlus setUserInteractionEnabled:TRUE];
        [_intMinus setUserInteractionEnabled:TRUE];
        [_intPlus setUserInteractionEnabled:TRUE];
        
        
        appDelegate.Player.lvlUp = FALSE;
    }
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
    [_descriptionTextView setText:@"Every 13 points of dex increases how many times you hit the enemy."];
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
    [_descriptionTextView setText:@"Every 13 points of dex increases how many times you hit the enemy.."];
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
