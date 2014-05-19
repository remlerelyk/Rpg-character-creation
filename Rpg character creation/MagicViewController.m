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
 Fire = 3
 Cure = 2
 Thunder = 4
 Ice = 5
 Bafire = 12
 Bacure = 10
 Bathunder = 15
 Baice = 18
 Bolufire = 23
 Cracure = 20
 Voltunder = 27
 Sheer Ice = 30
 SheerVoltabalu = 50
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
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
    /*
     Spell = spell cost
     Fire = 3
     Cure = 2
     Thunder = 4
     Ice = 5
     Bafire = 12
     Bacure = 10
     Bathunder = 15
     Baice = 18
     Bolufire = 23
     Cracure = 20
     Voltunder = 27
     Sheer Ice = 30
     SheerVoltabalu = 50
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     */
	// Do any additional setup after loading the view.
    appDelegate = [[UIApplication sharedApplication] delegate];
        _magicArray = [[NSMutableArray alloc] initWithObjects: @"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"" , nil];
        
        _magicArrayText = [[NSMutableArray alloc] initWithObjects: @"",@"",@"", @"",@"",@"",@"",@"",@"",@"",@"",@"",@""@"" ,nil];

  

    switch (appDelegate.Player.lvl)
    {
        case 75 ... 999:
            [_magicArray replaceObjectAtIndex:12 withObject:@"SheerVoltabalu:50MP"];
            [_magicArrayText replaceObjectAtIndex:12 withObject:@"SheerVoltabalu"];
        case 61 ... 74:
            [_magicArray replaceObjectAtIndex:11 withObject:@"Sheer Ice:30MP"];
            [_magicArrayText replaceObjectAtIndex:11 withObject:@"Sheer Ice"];
        case 49 ... 60:
            [_magicArray replaceObjectAtIndex:10 withObject:@"Voltunder:27MP"];
            [_magicArrayText replaceObjectAtIndex:10 withObject:@"Voltunder"];
        case 42 ... 48:
            [_magicArray replaceObjectAtIndex:9 withObject:@"Cracure:20MP"];
            [_magicArrayText replaceObjectAtIndex:9 withObject:@"Cracure"];
        case 34 ... 41:
            [_magicArray replaceObjectAtIndex:8 withObject:@"Bolufire:23MP"];
            [_magicArrayText replaceObjectAtIndex:8 withObject:@"Bolufire"];
        case 27 ... 33:
            [_magicArray replaceObjectAtIndex:7 withObject:@"Baice:18MP"];
            [_magicArrayText replaceObjectAtIndex:7 withObject:@"Baice"];
        case 21 ... 26:
            [_magicArray replaceObjectAtIndex:6 withObject:@"Bathunder:15MP"];
            [_magicArrayText replaceObjectAtIndex:6 withObject:@"Bathunder"];
        case 15 ... 20:
            [_magicArray replaceObjectAtIndex:5 withObject:@"Bacure:10MP"];
            [_magicArrayText replaceObjectAtIndex:5 withObject:@"Bacure"];
        case 10 ... 14:
            [_magicArray replaceObjectAtIndex:4 withObject:@"Bafire:12MP"];
            [_magicArrayText replaceObjectAtIndex:4 withObject:@"Bafire"];
        case 7 ... 9:
            [_magicArray replaceObjectAtIndex:3 withObject:@"Ice:5MP"];
            [_magicArrayText replaceObjectAtIndex:3 withObject:@"Ice"]; 
        
        case 5 ... 6:
            [_magicArray replaceObjectAtIndex:2 withObject:@"Thunder:4MP"];
            [_magicArrayText replaceObjectAtIndex:2 withObject:@"Thunder"];
            
            
        case 3 ... 4:
            [_magicArray replaceObjectAtIndex:1 withObject:@"Fire:3MP"];
            [_magicArrayText replaceObjectAtIndex:1 withObject:@"Fire"];
            
        case 2:
            NSLog(@"Fire");
            [_magicArray replaceObjectAtIndex:0 withObject:@"Cure:2MP"];
            [_magicArrayText replaceObjectAtIndex:0 withObject:@"Cure"];
            break;
            
            
            
        default:
            break;
    }
    //NSLog(@"Magic: %@", [_magicArray objectAtIndex:5]);
    [manaLabel setText:[NSString stringWithFormat:@"MP:%i/%i", [appDelegate.Player curMagic], [appDelegate.Player totalMagic]]];
    
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
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:@""])
    {
        //UITableViewCell * cell = [magicTable cellForRowAtIndexPath:indexPath];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell setUserInteractionEnabled:NO];
        //uset inyercation enabled
        //[cell setSelected:NO];
        
    }
    return cell;
}
/*-(void)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:@""])
    {
        UITableViewCell * cell = [magicTable cellForRowAtIndexPath:indexPath];
        [cell setSelected:NO];
        [cell UITableViewCellSelectionStyleNone];
       // [magicTable setAllowsSelection:NO];
        //uset inyercation enabled
        [cell setUserInteractionEnabled:NO];
    }
 
}*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [magicTable deselectRowAtIndexPath:indexPath animated:YES];
    //NSLog(@"%@", [_magicArray objectAtIndex:indexPath.row]);
    //[magicTable setUserInteractionEnabled:YES];
    NSLog(@"Curr: magic:%i", appDelegate.Player.curMagic);
    
    
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:0]])
    {
        //fire
        NSLog(@"what Magic: %@", [_magicArrayText objectAtIndex:indexPath.row]);
        if([appDelegate.Player curMagic] >= 2)
        {
            [appDelegate.Player setSpellCost:2];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic] - 2];
            _whatMagic = 0;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
            
        }
    }
       
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:1]])
    {
        //cure
        if([appDelegate.Player curMagic] >= 3)
        {
            [appDelegate.Player setSpellCost:3];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 3];
             _whatMagic = 1;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
           
        }
    }
       
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:2]])
    {
        //thunder
        if([appDelegate.Player curMagic] >= 4)
        {
            [appDelegate.Player setSpellCost:4];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 4];
             _whatMagic = 2;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
           
        }
    }
        
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:3]])
    {
        //ice
        if([appDelegate.Player curMagic] >= 5)
        {
            [appDelegate.Player setSpellCost:5];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 5];
            _whatMagic = 3;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
       
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:4]])
    {
        //bafire
        if([appDelegate.Player curMagic] >= 12)
        {
            [appDelegate.Player setSpellCost:12];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 12];
            _whatMagic = 4;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
         
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:5]])
    {
        //bacure
        if([appDelegate.Player curMagic] >= 10)
        {
            [appDelegate.Player setSpellCost:10];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 10];
            _whatMagic = 5;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
        
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:6]])
    {
        //bathunder
        if([appDelegate.Player curMagic] >= 15)
        {
            [appDelegate.Player setSpellCost:15];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 15];
            _whatMagic = 6;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
       
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:7]])
    {
        //baice
        if([appDelegate.Player curMagic] >= 18)
        {
            [appDelegate.Player setSpellCost:18];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 18];
            _whatMagic = 7;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:8]])
    {
        //Bolufire
        if([appDelegate.Player curMagic] >= 23)
        {
            [appDelegate.Player setSpellCost:23];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 23];
            _whatMagic = 8;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
   
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:9]])
    {
        //Cracure
        if([appDelegate.Player curMagic] >= 20)
        {
            [appDelegate.Player setSpellCost:20];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 20];
            _whatMagic = 9;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
   
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:10]])
    {
        //Voltunder
        if([appDelegate.Player curMagic] >= 27)
        {
            [appDelegate.Player setSpellCost:27];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 27];
            _whatMagic = 10;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
   
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:11]])
    {
        //Sheer Ice
        if([appDelegate.Player curMagic] >= 30)
        {
            [appDelegate.Player setSpellCost:30];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 30];
            _whatMagic = 11;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
   
    if([[_magicArray objectAtIndex:indexPath.row] isEqual:[_magicArray objectAtIndex:12]])
    {
        //SheerVoltabalu
        if([appDelegate.Player curMagic] >= 50)
        {
            [appDelegate.Player setSpellCost:50];
            [appDelegate.Player setCurMagic:[appDelegate.Player curMagic]- 50];
            _whatMagic = 12;
            [self performSegueWithIdentifier:@"magicUsed" sender:self];
        }
    }
    
   
    
    

    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"magicUsed"])
    {
        
        NSLog(@"Magic Exit");
        //NSLog(@"%@",_magicType);
        //NSIndexPath * indexPath = [self.magicTable indexPathForSelectedRow];
        NSLog(@"Magic Name:%i", _whatMagic);
        ViewControllerMain * destViewController = segue.destinationViewController;
        destViewController.attackString = [_magicArrayText objectAtIndex:_whatMagic];
    }
}
@end
