//
//  MagicViewController.m
//  Rpg character creation
//
//  Created by ELMER, KYLER ROBERT on 2/27/14.
//  Copyright (c) 2014 ELMER, KYLER ROBERT. All rights reserved.
//

#import "MagicViewController.h"

@interface MagicViewController ()

@end

@implementation MagicViewController
@synthesize magicTable;
@synthesize manaLabel;

/*
Spell = spell cost
 Fire = 2
 Ice = 3
 Thunder = 4
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*/
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
    _magicArray = [[NSMutableArray alloc] initWithObjects: @"Fire/2MP",@"Ice/3MP",@"Thunder/4MP", nil];
    _magicArrayText = [[NSMutableArray alloc] initWithObjects: @"Fire",@"Ice",@"Thunder", nil];
    appDelegate = [[UIApplication sharedApplication] delegate];
    [manaLabel setText:[NSString stringWithFormat:@"MP:%i/%i", [appDelegate.Player curMagic], [appDelegate.Player magic]]];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_magicArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * magicString = @"MagicCell";
    
    
    
    UITableViewCell * cell = [magicTable dequeueReusableCellWithIdentifier:magicString];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:magicString];
    }
    
    cell.textLabel.text = [_magicArray objectAtIndex:indexPath.row];
   // NSLog(@"%@", cell.textLabel.text);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [magicTable deselectRowAtIndexPath:indexPath animated:YES];
    //NSLog(@"%@", [_magicArray objectAtIndex:indexPath.row]);
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:0]])
    {
        NSLog(@"Fire Selected");
       // NSLog(@"%i", _currentMagic);
        if([appDelegate.Player curMagic] >= 2)
        {
            [appDelegate.Player setSpellCost:2];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]-2];
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
            
        }
         NSLog(@"%i", [appDelegate.Player curMagic]);
    }
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:1]])
    {
        NSLog(@"Ice Selected");
        if([appDelegate.Player curMagic] >= 3)
        {
            [appDelegate.Player setSpellCost:3];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]-3];
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
        
    }
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:2]])
    {
        NSLog(@"Thunder Selected");
        if([appDelegate.Player curMagic] >= 4)
        {
            [appDelegate.Player setSpellCost:4];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]-4];
            NSLog(@"MJ %i",[appDelegate.Player spellCost]);
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
        
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"magicUsed"])
    {
        
        NSLog(@"Magic Exit");
        NSLog(@"%@",_magicType);
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.attackString = [_magicArrayText objectAtIndex:appDelegate.Player.spellCost-2];
    }
}
@end
