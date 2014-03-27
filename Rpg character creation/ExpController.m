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
    [self animation];
    _iWin =[[NSBundle mainBundle] pathForResource:@"iWin" ofType:@"mp3"];
    _Win =[[NSBundle mainBundle] pathForResource:@"Win" ofType:@"mp3"];
    _audioURL = [NSURL fileURLWithPath:_iWin];
    [appDelegate.music stop];
    appDelegate.music =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioURL error:nil];
    [appDelegate.music play];
    [self performSelector:@selector(playRest) withObject:self afterDelay:15.2145f];


}
- (void)animation{
    float i = appDelegate.Player.expLvUP;
    float o = appDelegate.Player.exp;
    float temp = o/i;
    temp = temp*280;
    if(appDelegate.BarProgress){
    [UIView animateWithDuration:2.0f animations:^{
            _exp.frame =CGRectMake(16, 16, appDelegate.BarProgress, 16);
            _exp.frame =CGRectMake(16, 16, 280, 16);
            appDelegate.BarProgress=0;
        }];
                appDelegate.expLvl++;
        if (appDelegate.expLvl<=[appDelegate.Player expLvUP]){
            [self performSelector:@selector(animation) withObject:self afterDelay:2.1f];
        }
    }else if (appDelegate.Player.lvl!=appDelegate.expLvl) {
        [UIView animateWithDuration:2.0f animations:^{
            _exp.frame =CGRectMake(16, 16, 1, 16);
            _exp.frame =CGRectMake(16, 16, 280, 16);
        }completion:^(BOOL Done){if (Done){
            _exp.frame =CGRectMake(16, 16, 1, 16);
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
            }];
        
    }




}
-(void)playRest{
    _audioURL = [NSURL fileURLWithPath:_Win];
    [appDelegate.music stop];
    appDelegate.music =[[AVAudioPlayer alloc] initWithContentsOfURL:_audioURL error:nil];
    [appDelegate.music play];
    appDelegate.isMusic = TRUE;
    appDelegate.music.numberOfLoops = -1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)leaveView:(UIButton *)sender {
}
@end
