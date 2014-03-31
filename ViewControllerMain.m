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
//Start Here
- (void)viewDidLoad
{
    appDelegate.isLeft =FALSE;
    
   
    appDelegate = [[UIApplication sharedApplication] delegate];
    if(appDelegate.enemyAlive == FALSE)
    {
        
        [_attackLabel setText:@""];
        [_enemyDamageLabel setText:@""];
        [_playerDamageLabel setText:@""];
        //[_playerDamageLabel bringSubviewToFront:];
        _bob = [[Enemy alloc]initWithLv:appDelegate.Player.lvl /*[appDelegate.Player lvl]*/ andWith:[UIImage imageNamed:@"baddy.gif"]];
        appDelegate.enemyAlive = TRUE;
        appDelegate.Enemy = _bob;

       // [appDelegate.Enemy setCon:100];

        //[appDelegate.Enemy setStr:300];
        
        //[appDelegate.Player setCurHealth:9000];
        //[appDelegate.Player setTotalHealth:9000];
        [_enemyDamageLabel setText:@""];
        [_enemyHealthLabel setText:[NSString stringWithFormat:@"HP: %i", appDelegate.Enemy.Con]];

    
    }

    _buttonPress = FALSE;
    NSLog(@"Spell cost %i",appDelegate.Player.spellCost);    
        
        _Animation = [[UIImageView alloc] initWithFrame:CGRectMake(240, 24, 48, 48)];
    [self.view addSubview: _Animation];

    _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];
    [self.view addSubview: _baddy];
    [self.view addSubview:_playerDamageLabel];
    [self.view bringSubviewToFront:_playerDamageLabel];

    NSString * healthData = [NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth];
    NSString * manaData = [NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.magic];
    [_healthLabel setText:healthData];
    [_manaLabel setText:manaData];

    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    
    NSLog(@"%i", [appDelegate.Player curMagic]);
    

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

    
    
    if(appDelegate.overdriveUsed == TRUE)
    {
        [_attackLabel setText:[NSString stringWithFormat:@"%@", _attackString]];
        [_enemyHealthLabel setText:[NSString stringWithFormat:@"HP:%i", appDelegate.Enemy.Con ]];
        [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
        if(appDelegate.Enemy.Con <= 0)
        {
            NSLog(@"Enemy Dead");
            [appDelegate.Enemy setCon:0];
            [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
            appDelegate.enemyAlive = FALSE;
            _buttonPress = TRUE;
           // [self performSegueWithIdentifier:@"Uwin" sender:self];
            
        }
        if(appDelegate.enemyAlive == TRUE)
        {
            [appDelegate.Enemy enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.magic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
        }                appDelegate.overdriveUsed = FALSE;
    }
    if(appDelegate.Player.spellCost > 0)
    {
        
        [appDelegate.Player playerSpell];
        NSLog(@"Spell Damge:%i", appDelegate.Player.spellDamage);
        NSLog(@"Spell Cost: %i", appDelegate.Player.spellCost);
        [_attackLabel setText:_attackString];
        switch (appDelegate.Player.spellCost)
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
        }
        
        [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
        [_enemyHealthLabel setText:[NSString stringWithFormat:@"HP:%i", appDelegate.Enemy.Con]];
        [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
        NSLog(@"Enemy Exp: %i", appDelegate.Enemy.Exp);
        if(appDelegate.Enemy.Con <= 0)
        {
            [_enemyDamageLabel setText:@""];
            [appDelegate.Enemy setCon:0];
            [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
           // [self performSegueWithIdentifier:@"Uwin" sender:self];
            NSLog(@"Enemy Dead");
            appDelegate.enemyAlive = FALSE;
        }
        
        //start animation
        if(appDelegate.enemyAlive == TRUE)
        {
            [appDelegate.Enemy enemyAttack];
            [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
            [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
            
            [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
            [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.magic]];
            
            if(appDelegate.Player.curHealth <= 0)
            {
                //Show game over animation
                UIAlertView *  gameOverAlert = [[UIAlertView alloc]                                                                                                              initWithTitle:@"Game Over" message:@"You have died" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
                [gameOverAlert show];
            }
        }
        
        
        appDelegate.Player.spellCost = 0;
    }
}
-(void)viewDidAppear:(BOOL)animated
{
    if(appDelegate.Enemy.Con <= 0)
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
                NSLog(@"%i", appDelegate.Player.playerDamage);
                [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.playerDamage];
                [_enemyHealthLabel setText:[NSString stringWithFormat:@"HP:%i", appDelegate.Enemy.Con]];
                [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
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
                    if(appDelegate.Enemy.Con <= 0)
                    {
                        NSLog(@"Enemy Dead");
                        [appDelegate.Enemy setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
                        appDelegate.enemyAlive = FALSE;
                        _buttonPress = TRUE;
             
                        [self performSegueWithIdentifier:@"Uwin" sender:self];
                        
                    }

                    
                        
                        
                        _Temp = [_baddy image];
                    // Start enemy attack
                    if(appDelegate.enemyAlive == TRUE)
                    {
                        [appDelegate.Enemy enemyAttack];
                        [_enemyDamageLabel setText:[NSString stringWithFormat:@"%i", [appDelegate.Enemy enemyDamage]]];
                        [appDelegate.Player setCurHealth:appDelegate.Player.curHealth - appDelegate.Enemy.enemyDamage];
                        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken + appDelegate.Enemy.enemyDamage];
                        [_healthLabel setText:[NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth]];
                        [_manaLabel setText:[NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.magic]];
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
                            
                        }completion:^(BOOL badAttack){if (badAttack){
                            [UIView animateWithDuration:0.1 animations:^{
                                _baddy.alpha = 0.0f;
                                _baddy.alpha = 1.0f;
                                
                                
                                
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
