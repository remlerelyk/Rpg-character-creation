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
@synthesize tableData;


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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //NSLog(@"%i", _currentMagic);
    NSString * data = [NSString stringWithFormat:@"HP: %i/%i MP: %i/%i", _currentHealth , _totalHealth, _currentMagic, _totalMagic];
   // NSString * magic = [NSString stringWithFormat:@"MP: %i/%i", _totalMagic, _currentMagic];
    
    _showDataArray = [[NSMutableArray alloc] initWithObjects:
                      data, nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    
    // NSLog(@"%i", _currentMagic);
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [_showDataArray count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * simpleTableIdentifier = @"DataCell";

    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    //NSLog([_showDataArray objectAtIndex:indexPath.row]);
    cell.textLabel.text = [_showDataArray objectAtIndex:indexPath.row];

   
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //[_testLabel setText:[NSString stringWithFormat:@"%ld", (long)tableView.indexPathForSelectedRow.]];
    

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
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
}
@end
