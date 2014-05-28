//
//  OverdriveViewController.m
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 3/17/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "OverdriveViewController.h"

@interface OverdriveViewController ()

@end

@implementation OverdriveViewController
@synthesize overdriveTable;
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
    
    
    
     NSLog(@"Player Level:%i", appDelegate.Player.lvl);
    

        _overdriveArray = [[NSMutableArray alloc] initWithObjects:
                       @"",
                       @"",
                       @"",
                       @"",
                       @"",
                       @"",nil];
        _overdriveArrayName = [[NSMutableArray alloc] initWithObjects:
                       @"",
                       @"",
                       @"",
                       @"",
                       @"",
                       @"", nil];

    [_overdriveLabel setText:[NSString stringWithFormat:@"Damage Taken:%i", appDelegate.Player.damageTaken]];
    
    switch (appDelegate.Player.lvl)
    {
        case 40 ... 999:
            [_overdriveArray replaceObjectAtIndex:5 withObject:@"DNS:5000"];
            [_overdriveArrayName replaceObjectAtIndex:5 withObject:@"Dance of the Nine Swords"];
        case 30 ... 39:
            [_overdriveArray replaceObjectAtIndex:4 withObject:@"Between the eyes:2500"];
            [_overdriveArrayName replaceObjectAtIndex:4 withObject:@"Between the eyes"];
        case 20 ... 29:
            [_overdriveArray replaceObjectAtIndex:3 withObject:@"Jabbing the Abdomen:1000"];
            [_overdriveArrayName replaceObjectAtIndex:3 withObject:@"Jabbing the Abdomen"];
        case 15 ... 19:
            [_overdriveArray replaceObjectAtIndex:2 withObject:@"Smoltering Blade:500"];
            [_overdriveArrayName replaceObjectAtIndex:2 withObject:@"Smoltering Blade"];
        case 11 ... 14:
            [_overdriveArray replaceObjectAtIndex:1 withObject:@"Tri-Magic:100"];
            [_overdriveArrayName replaceObjectAtIndex:1 withObject:@"Tri-Magic"];
        case 6 ... 10:
            [_overdriveArray replaceObjectAtIndex:0 withObject:@"Multi-Slash:50"];
            [_overdriveArrayName replaceObjectAtIndex:0 withObject:@"Multi-Slash"];
            break;
            
        default:
            break;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_overdriveArray count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * overdriveString = @"OverdriveCell";
    
    
    
    UITableViewCell * cell = [overdriveTable dequeueReusableCellWithIdentifier:overdriveString];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:overdriveString];
    }
    
    cell.textLabel.text = [_overdriveArray objectAtIndex:indexPath.row];
    if([[_overdriveArray objectAtIndex:indexPath.row] isEqual:@""])
    {
        //UITableViewCell * cell = [overdriveTable cellForRowAtIndexPath:indexPath];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setUserInteractionEnabled:NO];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [overdriveTable deselectRowAtIndexPath:indexPath animated:YES];
    
    if((appDelegate.Player.damageTaken >= 50) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:0]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
       
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 50];
        [appDelegate.Player setPlayerDamage:50];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive = 0;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 100) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:1]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 100];
        [appDelegate.Player setPlayerDamage:100];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive = 1;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 500) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:2]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 500];
        [appDelegate.Player setPlayerDamage:500];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive = 2;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 1000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:3]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 1000];
        [appDelegate.Player setPlayerDamage:1000];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive = 3;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 2500) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:4]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 2500];
        [appDelegate.Player setPlayerDamage:2500];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive  = 4;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 5000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:5]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
         
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 5000];
        [appDelegate.Player setPlayerDamage:10000];
        appDelegate.overdriveUsed = TRUE;
        appDelegate.whatOverdrive = 5;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else
    {
        NSLog(@"Not Ready");
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"OverdriveUse"])
    {
        
        
        
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.attackString = [_overdriveArrayName objectAtIndex:appDelegate.whatOverdrive];
    }
}
@end
