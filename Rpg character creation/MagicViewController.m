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
    _magicArray = [[NSMutableArray alloc] initWithObjects: @"Fire",@"Ice",@"Thunder", nil];
   
    [manaLabel setText:[NSString stringWithFormat:@"MP:%i/%i", [appdelegate.Player curMagic], [appdelegate.Player magic]]];
    
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
        NSLog(@"%i", _currentMagic);
        [appdelegate.Player setCurMagic:[appdelegate.Player curMagic]-2];
         NSLog(@"%i", _currentMagic);
    }
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:1]])
    {
        NSLog(@"Ice Selected");
        [appdelegate.Player setCurMagic:[appdelegate.Player curMagic]-3];
    }
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:2]])
    {
        NSLog(@"Thunder Selected");
        [appdelegate.Player setCurMagic:[appdelegate.Player curMagic]-4];
    }
    
}
/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"magicSegueExit"])
    {
        NSLog(@"Exit");
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.totalMagic = _totalMagic;
        destViewController.currentMagic = _currentMagic;
        destViewController.totalHealth = _totalHealth;
        destViewController.currentHealth = _currentHealth;
    }
    if([segue.identifier isEqual:@"magicSegueMagicExit"])
    {
        
        NSLog(@"Magic Exit");
       // NSLog(@"%i", _currentMagic);
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.totalMagic = _totalMagic;
        destViewController.currentMagic = _currentMagic;
        destViewController.totalHealth = _totalHealth;
        destViewController.currentHealth = _currentHealth;
    }
}*/
@end
