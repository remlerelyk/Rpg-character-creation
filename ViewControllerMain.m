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

    NSArray * imgARRAY = [[NSArray alloc]initWithArray:[NSArray arrayWithObjects:[UIImage imageNamed:@"BG1.png"],[UIImage imageNamed:@"BG2.png"],[UIImage imageNamed:@"GB3.gif"],[UIImage imageNamed:@"BG4.png"], nil]];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];

    appDelegate.isLeft =FALSE;
    //appDelegate.Player.lvl ++;
   
    
    if(appDelegate.enemyAlive == FALSE)
    {
     
        int rnd = arc4random()%4;
        appDelegate.BGimg =[self imageWithImage:[imgARRAY objectAtIndex:rnd] borderImage:[UIImage imageNamed:@"battleFrame.gif"] covertToSize:CGSizeMake(320, 560)];
        
        
        
        [_attackLabel setText:@""];
        [_enemyDamageLabel setText:@""];
        [_playerDamageLabel setText:@""];
        //[_playerDamageLabel bringSubviewToFront:];

        _bob = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
        
        _jack = [[Enemy alloc]initWithLv:[appDelegate.Player lvl] andWith:[UIImage imageNamed:@"baddy.gif"]];
        //_bob = [[Enemy alloc]initWithLv:100 andWith:[UIImage imageNamed:@"baddy.gif"]];

        appDelegate.enemyAlive = TRUE;
        appDelegate.Enemy = _bob;
        appDelegate.EnemyTwo = _jack;
        
        //debugging
        
        //[appDelegate.Enemy setCon:10000];
        //[appDelegate.Enemy setStr:100];//100
        
        
        //[appDelegate.Player setLvl:100];//5 x 100 + 10= 510
        //[appDelegate.Player setDexterity:100];//100
        //[appDelegate.Player setCurHealth:9000];
        //[appDelegate.Player setTotalHealth:9000];
        //[appDelegate.Player setHealth:200];//200
        //[appDelegate.Player setDamageTaken:10000];
        //[appDelegate.Player setMagic:110];//120
        //[appDelegate.Player setCurMagic:120];
        //[appDelegate.Player setStrength:100];
        //[appDelegate.Player cleanStats];
        
        
        [_enemyDamageLabel setText:@""];

        [_enemyDamageLabel setTextColor:[UIColor whiteColor]];
    
    }
   [self.view setBackgroundColor:[UIColor colorWithPatternImage:appDelegate.BGimg]];

    _buttonPress = FALSE;
   // NSLog(@"Spell cost %i",appDelegate.Player.spellCost);
                                                                // 240  24 48 48
        _Animation = [[UIImageView alloc] initWithFrame:CGRectMake(240, 20, 48, 48)];
    
    [self.view addSubview: _Animation];

    _baddy = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, appDelegate.Enemy.width, appDelegate.Enemy.height)];
    _baddyTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, appDelegate.Enemy.width, appDelegate.Enemy.height)];
    
    [self.view addSubview: _baddy];
    [self.view addSubview: _baddyTwo];
    [self.view addSubview:_playerDamageLabel];
    [self.view addSubview:_playerHealLabel];
    [self.view bringSubviewToFront:_playerDamageLabel];
    [self.view bringSubviewToFront:_playerHealLabel];

    NSString * healthData = [NSString stringWithFormat:@"HP: %i/%i", appDelegate.Player.curHealth, appDelegate.Player.totalHealth];
    NSString * manaData = [NSString stringWithFormat:@"MP: %i/%i",appDelegate.Player.curMagic, appDelegate.Player.magic];
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
        [_baddyTwo setImage:[appDelegate.Enemy img]];
    
        
        
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
            [_enemyDamageLabel setTextColor:[UIColor colorWithWhite:1.0 alpha:1.0]];
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
        if(appDelegate.Player.spellCost == 2)
        {
            // cure
            [appDelegate.Player setSpellDamage:appDelegate.Player.totalHealth/4];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
            [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
            if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
            {
                [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
            }
            [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
        }
        else if(appDelegate.Player.spellCost == 10)
        {
            //Bacure
             [appDelegate.Player setSpellDamage:appDelegate.Player.totalHealth/2];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
            [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
            if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
            {
                [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
            }
            [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
        }
        else if(appDelegate.Player.spellCost == 20)
        {
            //Cracure
            [appDelegate.Player setSpellDamage:appDelegate.Player.totalHealth*.75];
            [appDelegate.Player setCurHealth:appDelegate.Player.curHealth + appDelegate.Player.spellDamage];
            [_playerHealLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
            if(appDelegate.Player.curHealth > appDelegate.Player.totalHealth)
            {
                [appDelegate.Player setCurHealth:appDelegate.Player.totalHealth];
            }
            [_healthLabel setText:[NSString stringWithFormat:@"HP:%i/%i",appDelegate.Player.curHealth,appDelegate.Player.totalHealth]];
        }
        else
        {
            [_attackLabel setText:_attackString];
            [appDelegate.Enemy setCon:appDelegate.Enemy.Con - appDelegate.Player.spellDamage];
            
            [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.spellDamage]];
            NSLog(@"Enemy Exp: %i", appDelegate.Enemy.Exp);
        }
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
    if(pointX >= 20 && pointX <= 66 && pointY >= 12 && pointY <= 75)
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
    if(pointX >= 20 && pointX <= 66  && pointY >= 102 && pointY <= 163)
    {
        appDelegate.enemySelected = 2;
       // [_selector delete:self];
        [_selector setImage:nil];
        
        _selector = [[UIImageView alloc] initWithFrame:CGRectMake(80, 120, 32, 20)];
        
        [self.view addSubview:_selector];
        
        
        [_selector setImage:[UIImage imageNamed:@"ff1.gif"]];
        
        NSLog(@"Enemy two working");
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
                    [_playerDamageLabel setText:[NSString stringWithFormat:@"%i", appDelegate.Player.playerDamage]];
                    NSLog(@"Number of hits: %i", appDelegate.Player.numberOfHits);
                    NSLog(@"Enemy two hit");
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
                    
                    if(appDelegate.Enemy.Con <= 0)
                    {
                        [appDelegate.Enemy setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.Enemy.Exp];
                        appDelegate.enemyAlive = FALSE;
                       // _buttonPress = TRUE;
                        NSLog(@"Enemy one dead");
                    }
                    if(appDelegate.EnemyTwo.Con <= 0)
                    {
                        [appDelegate.EnemyTwo setCon:0];
                        [appDelegate.Player addExperiance:appDelegate.EnemyTwo.Exp];
                        appDelegate.enemyAlive = FALSE;
                        
                        NSLog(@"Enemy two dead");
                    }
                    
                    if(appDelegate.Enemy.Con <= 0 && appDelegate.EnemyTwo.Con <= 0)
                    {
                       // NSLog(@"Enemy Dead");
                        [self performSegueWithIdentifier:@"Uwin" sender:self];
                        _buttonPress = TRUE;
                    }

                    
                        
                        
                        _Temp = [_baddy image];
                        _TempTwo = [_baddyTwo image];
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
-(UIImage *)imageWithImage:(UIImage *)image borderImage:(UIImage *)borderImage covertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [borderImage drawInRect:CGRectMake( 0, 110, size.width, 280 )];
    [borderImage drawInRect:CGRectMake( 0, 390, size.width, 170 )];
    [image drawInRect:CGRectMake( 0, 0, size.width, 110)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

@end
