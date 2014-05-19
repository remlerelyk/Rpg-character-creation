//
//  ViewControllerMain.m
//  Rpg character creation
//
//  Created by YOUNG, LUCAS ALLEN on 1/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "ViewControllerMain.h"

@interface ViewControllerMain ()

@end

@implementation ViewControllerMain

// WORKING ONE KEEPING SELECTION WHEN SELECTING A SPELL!!

// Don't worry about this
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        
        // Custom initialization
    }
    return self;
}

/*BUCKET LIST

FIRE DEAL HIGH DAMAGE ONE TARGET - 99%
LIGHTNING DEAL DAMAGE MULTIPLE TARGET MEDIUM DAMAGE 99 %
ICE DEAL DAMAGE MULTIPLE TARGET MINUMAL DAMAGE WITH FREEZE CHANCE 99 %

CHANGE OVERDRIVE POWER 0%
 
FIX STAT CHANGES 40 %
 
BOSS AT LVL 100 0 %





*/


//Start Here
- (void)viewDidLoad
{
    NSLog(@"Spell Cost:%i", appDelegate.Player.spellCost);
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.isLeft =FALSE;
    
    
    //appDelegate.Player.lvl ++;
    //[appDelegate.Player setExp:10000];
    //[appDelegate.Player levelUp];
    //[appDelegate.Player cleanStats];
    NSLog(@"Player Level: %i",appDelegate.Player.lvl);
    
    
    //[appDelegate.Player setLvl:33];
    if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == FALSE)
    {
        appDelegate.enemySelected = 0;
        int howManyEnemies = 0;
        if(appDelegate.Player.lvl <= 3)
        {
            howManyEnemies = 1;
        }
        else if(3 > appDelegate.Player.lvl < 8)
        {
            howManyEnemies = arc4random() % 2 + 1;
        }
        else if( appDelegate.Player.lvl > 9)
        {
            howManyEnemies = arc4random() % 3 +1;
        }
        
        //howManyEnemies = 1;
        //howManyEnemies = 2;
        //howManyEnemies = 3;
        
        
        NSLog(@"There are %i enemies", howManyEnemies);
        [_attackLabel setText:@""];
        [_enemyDamageLabel setText:@""];
        [_playerDamageLabel setText:@""];
        [_playerDamageLabelTwo setText:@""];
        [_playerDamageLabelThree setText:@""];
        //[_playerDamageLabel bringSubviewToFront:];
        if(howManyEnemies == 1)
        {
            _bob = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            
            appDelegate.Enemy = _bob;
            appDelegate.Enemy.alive = TRUE;
            appDelegate.EnemyTwo.alive = FALSE;
            
            _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];

        }
        if(howManyEnemies == 2)
        {
            _bob = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            _jack = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            
            appDelegate.Enemy = _bob;
            appDelegate.EnemyTwo = _jack;
            
            appDelegate.Enemy.alive = TRUE;
            appDelegate.EnemyTwo.alive = TRUE;
            
            _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];
            _baddyTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, appDelegate.EnemyTwo.width, appDelegate.EnemyTwo.height)];
        }
        if(howManyEnemies == 3)
        {
            _bob = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            _jack = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            _Jill = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
            
            appDelegate.Enemy = _bob;
            appDelegate.EnemyTwo = _jack;
            appDelegate.EnemyThree = _Jill;
            
            appDelegate.Enemy.alive = TRUE;
            appDelegate.EnemyTwo.alive = TRUE;
            appDelegate.EnemyThree.alive = TRUE;
            
            _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];
            _baddyTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, appDelegate.EnemyTwo.width, appDelegate.EnemyTwo.height)];
            _baddyThree = [[UIImageView alloc] initWithFrame:CGRectMake(10, 190, appDelegate.EnemyThree.width, appDelegate.EnemyThree.height)];
        }
        
        //_bob = [[Enemy alloc]initWithLv:100 andWith:[UIImage imageNamed:@"baddy.gif"]];
        
        

        
        
        

        
        //debugging
        
        [appDelegate.Enemy setCon:50000];
        [appDelegate.Enemy setStr:300];//100
        
        
        [appDelegate.Player setLvl:100];//5 x 100 + 10= 510
        [appDelegate.Player setDexterity:329];//329
        //[appDelegate.Player setCurHealth:9000];
        //[appDelegate.Player setTotalHealth:9000];
        [appDelegate.Player setHealth:392];//392
        [appDelegate.Player setDamageTaken:10000];
        [appDelegate.Player setMagic:367];//367
        //[appDelegate.Player setCurMagic:120];
        [appDelegate.Player setStrength:496];//496
        [appDelegate.Player cleanStats];
        
        
        [_enemyDamageLabel setText:@""];

        
    }
    _buttonPress = FALSE;
   // NSLog(@"Spell cost %i",appDelegate.Player.spellCost);
                                                                // 240  24 48 48
    _Animation = [[UIImageView alloc] initWithFrame:CGRectMake(240, 20, 48, 48)];
    
    [self.view addSubview: _Animation];

    _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];
    _baddyTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, appDelegate.EnemyTwo.width, appDelegate.EnemyTwo.height)];
     _baddyThree = [[UIImageView alloc] initWithFrame:CGRectMake(10, 190, appDelegate.EnemyThree.width, appDelegate.EnemyThree.height)];
    
    [self.view addSubview: _baddy];
    [self.view addSubview: _baddyTwo];
    [self.view addSubview:_baddyThree];
    [self.view addSubview:_playerDamageLabel];
    [self.view addSubview:_playerDamageLabelTwo];
    [self.view addSubview:_playerDamageLabelThree];
    [self.view addSubview:_playerHealLabel];
    [self.view bringSubviewToFront:_playerDamageLabel];
    [self.view bringSubviewToFront:_playerDamageLabelTwo];
    [self.view bringSubviewToFront:_playerDamageLabelThree];
    [self.view bringSubviewToFront:_playerHealLabel];

    NSString * healthData = [NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth];
    NSString * manaData = [NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic];
    [_healthLabel setText:healthData];
    [_manaLabel setText:manaData];

    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    
   // NSLog(@"%i", [appDelegate.Player curMagic]);
    

    _hit = [[NSBundle mainBundle] pathForResource:@"hit" ofType:@"mp3"];
    _death = [[NSBundle mainBundle] pathForResource:@"death" ofType:@"mp3"];
    _cure = [[NSBundle mainBundle] pathForResource:@"cure" ofType:@"mp3"];
    
    
    if(appDelegate.isMusic){
    _audioPath = [[NSBundle mainBundle] pathForResource:@"ff7bat" ofType:@"mp3"];
    _audioURL = [NSURL fileURLWithPath:_audioPath];
    appDelegate.music =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioURL error:nil];
    [appDelegate.music play];
        appDelegate.isMusic = FALSE;
        appDelegate.music.numberOfLoops = -1;
        }
        


        
        _mWalk = [[NSArray alloc]initWithArray:[NSArray arrayWithObjects:[UIImage imageNamed:@"mf1.gif"],[UIImage imageNamed:@"mf2.gif"],[UIImage imageNamed:@"mf3.gif"],[UIImage imageNamed:@"mf4.gif"], nil]];
        _mWin = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:[UIImage imageNamed:@"mf2.gif"],[UIImage imageNamed:@"mw.gif"], nil]];
        _fWalk = [[NSArray alloc]initWithArray:[NSArray arrayWithObjects:[UIImage imageNamed:@"ff1.gif"],[UIImage imageNamed:@"ff2.gif"],[UIImage imageNamed:@"ff3.gif"],[UIImage imageNamed:@"ff4.gif"], nil]];
        _fWin = [[NSArray alloc] initWithArray:[NSArray arrayWithObjects:[UIImage imageNamed:@"ff2.gif"],[UIImage imageNamed:@"fw.gif"], nil]];
       // _buttonPress = TRUE;
        [super viewDidLoad];
        [_baddy setImage:[appDelegate.Enemy img]];
        [_baddyTwo setImage:[appDelegate.EnemyTwo img]];
        [_baddyThree setImage:[appDelegate.EnemyThree img]];
    
        // IMPLEMENTING ENEMY THREE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    
        // If enemy one dead, and two alive select two
        // if enemy one dead and two dead select three
        // if enemy one alive select one
    
    
        if(appDelegate.Enemy.alive == FALSE)
        {
            [_baddy setImage:nil];
        }
        if(appDelegate.EnemyTwo.alive == FALSE)
        {
            [_baddyTwo setImage:nil];
        }
        if(appDelegate.EnemyThree.alive == FALSE)
        {
            [_baddyThree setImage:nil];
        }
        if(appDelegate.enemySelected == 0)
        {
            if(appDelegate.Enemy.alive == TRUE)
            {
                appDelegate.enemySelected = 1;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 30, 32, 20)]; // enemy one
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
                
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == TRUE)
            {
                appDelegate.enemySelected = 2;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)]; // enemy two
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == TRUE)
            {
                appDelegate.enemySelected = 3;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 210, 32, 20)]; // enemy three
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
        }
    
    
    
    
        if([appDelegate.Player isMale]==TRUE){
            _uWalk = [[NSArray alloc]initWithArray:_mWalk];
            _uWin = [[NSArray alloc]initWithArray:_mWin];
            _uIdle = [UIImage imageNamed:@"mf2.gif"];
        }else{
            _uWalk = [[NSArray alloc]initWithArray:_fWalk];
            _uWin = [[NSArray alloc]initWithArray:_fWin];
            _uIdle = [UIImage imageNamed:@"ff2.gif"];
        }
        [_Animation setImage:_uIdle];

    //adding a second enemy
    
    if(appDelegate.overdriveUsed == TRUE)
    {
        
        [_attackLabel setText:[NSString stringWithFormat:@"%@", _attackString]];
        if(appDelegate.enemySelected == 1)
        {
            [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
            [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.playerDamage];
        }
        if(appDelegate.enemySelected == 2)
        {
            [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
            [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.playerDamage];
        }
        if(appDelegate.enemySelected == 3)
        {
            [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
            [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.playerDamage];
        }
        
        if(appDelegate.Enemy.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.Enemy setCon:0];
            [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
            appDelegate.Enemy.alive = FALSE;
            [_baddy setImage:nil];
           // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if(appDelegate.EnemyTwo.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.EnemyTwo setCon:0];
            [appDelegate.Player addExperiance:appDelegate.EnemyTwo.Exp];
            appDelegate.EnemyTwo.alive = FALSE;
            [_baddyTwo setImage:nil];
            // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if(appDelegate.EnemyThree.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.EnemyThree setCon:0];
            [appDelegate.Player addExperiance:appDelegate.EnemyThree.Exp];
            appDelegate.EnemyThree.alive = FALSE;
            [_baddyThree setImage:nil];
            // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if((appDelegate.Enemy.alive && appDelegate.EnemyTwo.alive && appDelegate.EnemyThree.alive) == FALSE )
        {
            [self performSegueWithIdentifier:@"Uwin" sender:self];
        }
        if(appDelegate.Enemy.alive == TRUE)
        {
            [appDelegate.Enemy enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        if(appDelegate.EnemyTwo.alive == TRUE)
        {
            [appDelegate.EnemyTwo enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyTwo enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyTwo.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyTwo.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        if(appDelegate.EnemyThree.alive == TRUE)
        {
            [appDelegate.EnemyThree enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyThree enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyThree.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyThree.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        appDelegate.overdriveUsed = FALSE;
        [_playerDamageLabel setText:@""];
        [_playerDamageLabelTwo setText:@""];
        [_playerDamageLabelThree setText:@""];
        appDelegate.enemySelected = 0;
        if(appDelegate.enemySelected == 0)
        {
            if(appDelegate.Enemy.alive == TRUE)
            {
                appDelegate.enemySelected = 1;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 30, 32, 20)];
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == TRUE )
            {
                appDelegate.enemySelected = 2;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)]; // enemy two
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == TRUE)
            {
                appDelegate.enemySelected = 3;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 210, 32, 20)];
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
        }
    }
    if(appDelegate.Player.spellCost > 0)
    {
        NSLog(@"Start of magic");
        [appDelegate.Player playerSpell];
        NSLog(@"Spell Damge:%i", appDelegate.Player.spellDamage);
        NSLog(@"Spell Cost: %i", appDelegate.Player.spellCost);
    
        
        /*switch (appDelegate.Player.spellCost)
        {
            case 2:
                
                break;
            case 3:
                
                break;
            case 4:
                NSLog(@"spell animattion");
                _magicLayer = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 300)];
                [_magicLayer setAnimationImages:[NSArray arrayWithObjects:[UIImage imageNamed:@"t1.png"],[UIImage imageNamed:@"t2.png"],[UIImage imageNamed:@"t3.png"],[UIImage imageNamed:@"t4.png"],[UIImage imageNamed:@"t5.png"],[UIImage imageNamed:@"t6.png"],[UIImage imageNamed:@"t7.png"],[UIImage imageNamed:@"t8.png"],[UIImage imageNamed:@"t9.png"],[UIImage imageNamed:@"t10.png"],[UIImage imageNamed:@"t11.png"],[UIImage imageNamed:@"t12.png"],[UIImage imageNamed:@"t13.png"],[UIImage imageNamed:@"t14.png"],[UIImage imageNamed:@"t15.png"],[UIImage imageNamed:@"t16.png"], nil]];
                [_magicLayer setAnimationRepeatCount:1];
                [_magicLayer startAnimating];
                break;
                
            default:
                NSLog(@"U haz no makics");
                break;
        }*/
        
        switch (appDelegate.Player.spellCost)
        {
            case 2:

                    // cure
                    [appDelegate.Player setSpellDamage:50];
                    [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
                    [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
                    {
                        [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
                    }
                    [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
                break;

            case 3:
                //Fire
                [appDelegate.Player setSpellDamage:50];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.enemySelected == 1)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 2)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 3)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 4:
                // thunder
              
                
                [appDelegate.Player setSpellDamage:40];
                [_attackLabel setText:_attackString];

                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }   
                

                break;
            case 5:
                //Ice
                [appDelegate.Player setSpellDamage:20];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 20)
                    {
                        [_playerDamageLabel setText:@"Frozen"];
                        [appDelegate.Enemy setIsFrozen:TRUE];
                    }
                    //[_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 20)
                    {
                        [_playerDamageLabelTwo setText:@"Frozen"];
                        [appDelegate.EnemyTwo setIsFrozen:TRUE];
                    }
                    //[_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 20)
                    {
                        [_playerDamageLabelThree setText:@"Frozen"];
                        [appDelegate.EnemyThree setIsFrozen:TRUE];
                    }
                   // [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            
           
            case 10:
                    //Bacure
                    [appDelegate.Player setSpellDamage:150];
                    [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
                    [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
                    {
                        [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
                    }
                    [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
                break;
            case 12:
                //Bafire
                [appDelegate.Player setSpellDamage:2000];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.enemySelected == 1)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 2)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 3)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 15:
                //Bathunder
                [appDelegate.Player setSpellDamage:1200];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 18:
                //Baice
                [appDelegate.Player setSpellDamage:400];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 30)
                    {
                        [_playerDamageLabel setText:@"Frozen"];
                        [appDelegate.Enemy setIsFrozen:TRUE];
                    }
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 30)
                    {
                        [_playerDamageLabelTwo setText:@"Frozen"];
                        [appDelegate.EnemyTwo setIsFrozen:TRUE];
                    }
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 30)
                    {
                        [_playerDamageLabelThree setText:@"Frozen"];
                        [appDelegate.EnemyThree setIsFrozen:TRUE];
                    }
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }

                break;
            case 20:
                    //Cracure
                    [appDelegate.Player setSpellDamage:700];
                    [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
                    [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
                    {
                        [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
                    }
                    [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
                break;
                
            case 23:
                //Bolufire
                [appDelegate.Player setSpellDamage:4500];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.enemySelected == 1)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 2)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 3)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 27:
                //Voltunder
                [appDelegate.Player setSpellDamage:3000];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 30:
                //Sheer Ice
                [appDelegate.Player setSpellDamage:1000];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 50)
                    {
                        [_playerDamageLabel setText:@"Frozen"];
                        [appDelegate.Enemy setIsFrozen:TRUE];
                    }
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 50)
                    {
                        [_playerDamageLabelTwo setText:@"Frozen"];
                        [appDelegate.EnemyTwo setIsFrozen:TRUE];
                    }
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    _frozenChance = arc4random() % 100 + 1;
                    if(_frozenChance > 50)
                    {
                        [_playerDamageLabelThree setText:@"Frozen"];
                        [appDelegate.EnemyThree setIsFrozen:TRUE];
                    }
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                break;
            case 50:
                //SheerVoltabalu
                [appDelegate.Player setSpellDamage:6000];
                [_attackLabel setText:_attackString];
                
                
                if(appDelegate.Enemy.alive == TRUE)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyTwo.alive == TRUE)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.EnemyThree.alive == TRUE)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }

                break;
                
            default:
                NSLog(@"Not working");
              /*  [_attackLabel setText:_attackString];
                
                
                if(appDelegate.enemySelected == 1)
                {
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 2)
                {
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.spellDamage];
                }
                if(appDelegate.enemySelected == 3)
                {
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.spellDamage];
                }
                NSLog(@"Enemy Exp: %i", appDelegate.Enemy.Exp);*/
                break;
        }
        
        
        
        
        if(appDelegate.Enemy.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.Enemy setCon:0];
            [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
            appDelegate.Enemy.alive = FALSE;
            [_baddy setImage:nil];
            // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if(appDelegate.EnemyTwo.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.EnemyTwo setCon:0];
            [appDelegate.Player addExperiance:appDelegate.EnemyTwo.Exp];
            appDelegate.EnemyTwo.alive = FALSE;
            [_baddyTwo setImage:nil];
            // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if(appDelegate.EnemyThree.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.EnemyThree setCon:0];
            [appDelegate.Player addExperiance:appDelegate.EnemyThree.Exp];
            appDelegate.EnemyThree.alive = FALSE;
            [_baddyThree setImage:nil];
            // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if((appDelegate.Enemy.alive && appDelegate.EnemyTwo.alive && appDelegate.EnemyThree.alive) == FALSE )
        {
            [self performSegueWithIdentifier:@"Uwin" sender:self];
        }
        if(appDelegate.Enemy.alive == TRUE && appDelegate.Enemy.isFrozen == FALSE)
        {
            [appDelegate.Enemy enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        else
        {
            NSLog(@"Enemy one Not Attacking");
        }
        if(appDelegate.EnemyTwo.alive == TRUE && appDelegate.EnemyTwo.isFrozen == FALSE)
        {
            [appDelegate.EnemyTwo enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyTwo enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyTwo.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyTwo.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        else
        {
            NSLog(@"Enemy two Not Attacking");
        }
        if(appDelegate.EnemyThree.alive == TRUE && appDelegate.EnemyThree.isFrozen == FALSE)
        {
            [appDelegate.EnemyThree enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyThree enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyThree.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyThree.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
            
        }
        else
        {
            NSLog(@"Enemy threeNot Attacking");
        }
        
        appDelegate.enemySelected = 0;
        appDelegate.Player.spellCost = 0;
        //[_playerDamageLabel setText:@""];
        //[_playerDamageLabelTwo setText:@""];
        //[_playerDamageLabelThree setText:@""];
        if(appDelegate.enemySelected == 0)
        {
            if(appDelegate.Enemy.alive == TRUE)
            {
                appDelegate.enemySelected = 1;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 30, 32, 20)];
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == TRUE )
            {
                appDelegate.enemySelected = 2;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)]; // enemy two
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
            if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == TRUE)
            {
                appDelegate.enemySelected = 3;
                [_selector setImage:nil];
                _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 210, 32, 20)];
                [self.view addSubview:_selector];
                
                [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
            }
        }
    }
    NSLog(@"Enemy two con: %i", appDelegate.EnemyTwo.Con);
}
-(void)selection:(int)x andWith:(int)y
{
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint thePoint = [[touches anyObject] locationInView:self.view];
    //CGPoint baddyPoint = [[_theSet anyObject] locationInView:self.view];
    //NSLog(@"the object in the set is%f", thePoint);
    //NSLog(@"the object in the set is%f", baddyPoint);
    int pointX = thePoint.x;
    int pointY = thePoint.y;
    //int baddyPointX = baddyPoint.x;
    //int baddyPointY = baddyPoint.y;
    
    
    /*
     boundary box for baddy one
     
     TLC, x = 20, y = 12
     TRC, x = 66, y = 12
     BLC, x = 20, y = 75
     BRC, x = 66, y = 75
     
     
     */
    
    NSLog(@" point x = %i ", pointX);
    NSLog(@" point y = %i ", pointY);
    if(pointX >= 20 && pointX <= 66 && pointY >= 12 && pointY <= 75 && appDelegate.Enemy.alive == TRUE)
    {
        
        appDelegate.enemySelected = 1;
        
        [_selector setImage:nil];
        
        _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 30, 32, 20)];
        
        [self.view addSubview:_selector];
        
        [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
        
        NSLog(@"Enemy one working");
    }
    /*
     
     Boundary box for baddy two
     
     TLC x = 20, y = 102
     TRC x = 66, y = 102
     BLC x = 20, y = 163
     BRC x = 66, y = 163
    
     selector one
     
     
     
     
    */
    if(pointX >= 20 && pointX <= 66  && pointY >= 102 && pointY <= 163 && appDelegate.EnemyTwo.alive == TRUE)
    {
        appDelegate.enemySelected = 2;
       // [_selector delete:self];
        [_selector setImage:nil];
        
        _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)];
        
        [self.view addSubview:_selector];
        
        
        [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
        
        NSLog(@"Enemy two working");
    }
    
    /*
     
     Boundrary box for baddy three
     
     TLC x = 20, y = 193
     TRC x = 66, y = 193
     BLC x = 20, y = 254
     BRC x = 66, y = 254
     
     
     */
    if(pointX >= 20 && pointX <= 66  && pointY >= 193 && pointY <= 254 && appDelegate.EnemyThree.alive == TRUE)
    {
        appDelegate.enemySelected = 3;
        // [_selector delete:self];
        [_selector setImage:nil];
        
        _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 210, 32, 20)];
        
        [self.view addSubview:_selector];
        
        
        [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
        
        NSLog(@"Enemy three working");
    }
    
    //NSLog(@" point x = %i ", baddyPointX);
    //NSLog(@" point x = %i ", baddyPointY);
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)viewDidAppear:(BOOL)animated
{
    if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == FALSE)
    {
        [self performSegueWithIdentifier:@"Uwin" sender:self];
    }
}
/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"magicSegueEnter"])
    {
        NSLog(@"Enter");
        MagicViewController * destViewController = segue.destinationViewController;
        destViewController.totalMagic = _totalMagic;
        destViewController.currentMagic = _currentMagic;
        destViewController.totalHealth = _totalHealth;
        destViewController.currentHealth = _currentHealth;
    }
}*/
- (IBAction)Attack:(UIButton *)sender
{
    if (_buttonPress == FALSE)
    {
        
        
        _buttonPress = TRUE;
        //start your attack
        [_Animation setAnimationImages:_uWalk];
        _Animation.animationDuration = 1.0f;
        [_Animation startAnimating];
        [UIView animateWithDuration:1.0 animations:^{
            _Animation.frame = CGRectMake(240,20,48,48);
            _Animation.frame = CGRectMake(64,20,48,48);
        }completion:^(BOOL finished) {
            if (finished){
                // start doing damage
            
                [appDelegate.Player playerAttack];
               // NSLog(@"%i", appDelegate.Player.playerDamage);
                if(appDelegate.enemySelected == 1)
                {
                    [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.playerDamage];
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
                    NSLog(@"Number of hits: %i", appDelegate.Player.numberOfHits);
                    NSLog(@"Enemy one hit");
                }
                else if(appDelegate.enemySelected == 2)
                {
                    [appDelegate.EnemyTwo setCon:appDelegate.EnemyTwo.Con - appDelegate.Player.playerDamage];
                    [_playerDamageLabelTwo setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
                    NSLog(@"Number of hits: %i", appDelegate.Player.numberOfHits);
                    NSLog(@"Enemy two hit");
                }
                else if(appDelegate.enemySelected == 3)
                {
                    [appDelegate.EnemyThree setCon:appDelegate.EnemyThree.Con - appDelegate.Player.playerDamage];
                    [_playerDamageLabelThree setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
                    NSLog(@"Number of hits: %i", appDelegate.Player.numberOfHits);
                    NSLog(@"Enemy three hit");
                }
                
            
                _Animation.transform = CGAffineTransformMakeScale(-1, 1);
                _audioSFX = [NSURL fileURLWithPath:_hit];
                appDelegate.sfx =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioSFX error:nil];
                [appDelegate.sfx play];
                [_Animation stopAnimating];
                _Animation.animationDuration = 0.5f;
                [_Animation startAnimating];
                [UIView animateWithDuration:0.5 animations:^{
                    _Animation.frame = CGRectMake(64,20,48,48);
                    _Animation.frame = CGRectMake(240,20,48,48);
                }completion:^(BOOL Done){if (Done){
                    _Animation.transform = CGAffineTransformMakeScale(1, 1);
                    [_playerDamageLabel setText:@""];
                    [_playerDamageLabelTwo setText:@""];
                    [_playerDamageLabelThree setText:@""];
                    if(appDelegate.Enemy.Con <= 0)
                    {
                        [appDelegate.Enemy setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
                        appDelegate.Enemy.alive = FALSE;
                        [_baddy setImage:nil];
                       // _buttonPress = TRUE;
                        NSLog(@"Enemy one dead");
                    }
                    if(appDelegate.EnemyTwo.Con <= 0)
                    {
                        
                        [appDelegate.EnemyTwo setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.EnemyTwo.Exp];

                        appDelegate.EnemyTwo.alive = FALSE;
                        [_baddyTwo setImage:nil];
                        NSLog(@"Enemy two dead");
                    }
                    if(appDelegate.EnemyThree.Con <= 0)
                    {
                        
                        [appDelegate.EnemyThree setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.EnemyThree.Exp];
                        
                        appDelegate.EnemyThree.alive = FALSE;
                        [_baddyThree setImage:nil];
                        NSLog(@"Enemy two dead");
                    }
                    
                    if(appDelegate.Enemy.Con <= 0 && appDelegate.EnemyTwo.Con <= 0 && appDelegate.EnemyThree.Con <= 0)
                    {
                       // NSLog(@"Enemy Dead");
                        [self performSegueWithIdentifier:@"Uwin" sender:self];
                        _buttonPress = TRUE;
                    }

                    
                        
                        
                        _Temp = [_baddy image];
                        _TempTwo = [_baddyTwo image];
                        _TempThree = [_baddyThree image];
                    // Start enemy attack
                        //NSLog(@"IS enemy alive%c",appDelegate.Enemy.alive);
                    
                        if(appDelegate.Enemy.alive == TRUE)
                        {
                            //NSLog(@"The first enemy is working");
                            [appDelegate.Enemy enemyAttack];
                            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
                            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
                            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
                            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
                            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
                            NSLog(@"Enemy one attacking");
                            _buttonPress = FALSE;
                            if(appDelegate.Player.curHealth <= 0)
                            {
                                //Show game over animation
                                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                                [gameOverAlert show];
                            }

                        }
                        if(appDelegate.EnemyTwo.alive == TRUE)
                        {
                            [appDelegate.EnemyTwo enemyAttack];
                            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyTwo enemyDamage]]];
                            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyTwo.enemyDamage];
                            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyTwo.enemyDamage];
                            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
                            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
                            NSLog(@"Enemy two attacking");
                            _buttonPress = FALSE;
                            if(appDelegate.Player.curHealth <= 0)
                            {
                                //Show game over animation
                                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                                [gameOverAlert show];
                            }
                            
                        }
                    if(appDelegate.EnemyThree.alive == TRUE)
                    {
                        [appDelegate.EnemyThree enemyAttack];
                        [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.EnemyThree enemyDamage]]];
                        [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.EnemyThree.enemyDamage];
                        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.EnemyThree.enemyDamage];
                        [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
                        [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.totalMagic]];
                        NSLog(@"Enemy three attacking");
                        _buttonPress = FALSE;
                        if(appDelegate.Player.curHealth <= 0)
                        {
                            //Show game over animation
                            UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                            [gameOverAlert show];
                        }
                        
                    }
                    
                    //enemy attack animation
                    
                        [UIView animateWithDuration:0.1 animations:^{
                            _baddy.alpha = 1.0f;
                            _baddy.alpha = 0.0f;
                           // _baddyTwo.alpha = 1.0f;
                            //_baddyTwo.alpha = 0.0f;
                            
                        }completion:^(BOOL badAttack){if (badAttack){
                            [UIView animateWithDuration:0.1 animations:^{
                                _baddy.alpha = 0.0f;
                                _baddy.alpha = 1.0f;
                               // _baddyTwo.alpha = 0.0f;
                               // _baddyTwo.alpha = 1.0f;
                                
                                
                                
                            }completion:^(BOOL ATTACK){if (ATTACK){
                                [UIView animateWithDuration:0.7 animations:^{
                                    _audioSFX = [NSURL fileURLWithPath:_hit];
                                    appDelegate.sfx =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioSFX error:nil];
                                    [appDelegate.sfx play];
                                }completion:^(BOOL ATTACK2){if (ATTACK2){
                                    [UIView animateWithDuration:1.0 animations:^{
                                        [_Animation stopAnimating];
                                        [_Animation setAnimationImages:[NSArray arrayWithObject:[UIImage imageNamed:@"mh.gif"
                                                                                                 ]]];
                                        
                                        
                                        
                                    }completion:^(BOOL finished) {if(finished){
                                        [_Animation setAnimationImages:[NSArray arrayWithObject:_uIdle]];
                                        //_buttonPress = TRUE;
                                    }
                                    }];
                                }}];
                            }}];}
                        }];}
                    [_Animation stopAnimating];
                    [_Animation setImage:_uIdle];
                    _buttonPress = FALSE;
                    appDelegate.enemySelected = 0;
                    if(appDelegate.enemySelected == 0)
                    {
                        if(appDelegate.Enemy.alive == TRUE)
                        {
                            appDelegate.enemySelected = 1;
                            [_selector setImage:nil];
                            _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 30, 32, 20)];
                            [self.view addSubview:_selector];
                            
                            [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
                        }
                        if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == TRUE )
                        {
                            appDelegate.enemySelected = 2;
                            [_selector setImage:nil];
                            _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)]; // enemy two
                            [self.view addSubview:_selector];
                            
                            [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
                        }
                        if(appDelegate.Enemy.alive == FALSE && appDelegate.EnemyTwo.alive == FALSE && appDelegate.EnemyThree.alive == TRUE)
                        {
                            appDelegate.enemySelected = 3;
                            [_selector setImage:nil];
                            _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 210, 32, 20)];
                            [self.view addSubview:_selector];
                            
                            [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
                        }
                    }
                }];
                
            }}];
    }

}

- (IBAction)Overdrive:(UIButton *)sender
{
    if(_buttonPress == false)
    {
        [self performSegueWithIdentifier:@"OverdriveButton" sender:self];
        _buttonPress = true;
    }
}

- (IBAction)Magic:(UIButton *)sender
{
    if(_buttonPress == false)
    {
        [self performSegueWithIdentifier:@"MagicButton" sender:self];
        _buttonPress = true;
    }
}
- (UIImage *)applyColor:(UIColor *)color toImage:(UIImage*)toImage{
    UIGraphicsBeginImageContextWithOptions(toImage.size, NO, toImage.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, toImage.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, toImage.size.width, toImage.size.height);
    //CGContextDrawImage(context, rect, img.CGImage);
    
    // Create gradient
    NSArray *colors = [NSArray arrayWithObjects:(id)color.CGColor, (id)color.CGColor, nil];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
    // Apply gradient
    CGContextClipToMask(context, rect, toImage.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0, toImage.size.height), 0);
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    
    return coloredImage;
}


@end
