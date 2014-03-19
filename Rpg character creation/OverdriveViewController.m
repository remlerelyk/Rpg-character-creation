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
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
        
        
    }
    else if((appDelegate.Player.damageTaken >= 100) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:1]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 100];
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 500) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:2]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 500];
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 1000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:3]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 1000];
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else if((appDelegate.Player.damageTaken >= 5000) && [[_overdriveArray objectAtIndex:indexPath.row] isEqual:[_overdriveArray objectAtIndex:4]])
    {
        NSLog(@"%@ ready", [_overdriveArray objectAtIndex:indexPath.row]);
        [appDelegate.Player setDamageTaken:appDelegate.Player.damageTaken - 5000];
        [self performSegueWithIdentifier:@"OverdriveUse" sender:self];
    }
    else
    {
        NSLog(@"Not Ready");
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
