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
    _overdriveArray = [[NSMutableArray alloc] initWithObjects:
                       @"Multi-Slash:50",
                       @"Tri-Magic:100",
                       @"Smoltering Blade:500",
                       @"Jabbing the Abdomen:1000",
                       @"DNS:5000", nil];
    _overdriveArrayName = [[NSMutableArray alloc] initWithObjects:
                       @"Multi-Slash",
                       @"Tri-Magic",
                       @"Smoltering Blade",
                       @"Jabbing the Abdomen",
                       @"Dance of the Nine Swords", nil];
    [_overdriveLabel setText:[NSString stringWithFormat:@"Damage Taken:%i", appDelegate.Player.damageTaken]];
    
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
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if((appDelegate.Player.damageTaken >= 50) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:0]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Enemy setCon:appDelegate.Enemy.Con - 500];
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 50];
        appDelegate.overdriveUsed = TRUE;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 100) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:1]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
         [appDelegate.Enemy setCon:appDelegate.Enemy.Con - 1000];
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 100];
        appDelegate.overdriveUsed = TRUE;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 500) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:2]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
         [appDelegate.Enemy setCon:appDelegate.Enemy.Con - 5000];
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 500];
        appDelegate.overdriveUsed = TRUE;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 1000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:3]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
         [appDelegate.Enemy setCon:appDelegate.Enemy.Con - 10000];
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 1000];
        appDelegate.overdriveUsed = TRUE;
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 5000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:4]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
         [appDelegate.Enemy setCon:appDelegate.Enemy.Con - 50000];
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 5000];
        appDelegate.overdriveUsed = TRUE;
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
        NSIndexPath * indexPath = [self.overdriveTable indexPathForSelectedRow];
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.attackString = [_overdriveArrayName objectAtIndex:indexPath.row];
    }
}
@end
