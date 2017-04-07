//
//  ViewController.m
//  Day25_studentApp
//
//  Created by Student 12 on 4/4/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseLib.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *query=@"select * from studTable";
    self.myArray=[[DatabaseLib getSharedObject]getAllTasks:query];
    NSLog(@"Roll Array %@",self.rollArray);
    //NSString *rollquery=@"select roll from studTable";
    self.rollArray=[[DatabaseLib getSharedObject]getAllTasks1:query];
    
    [self.myTableView reloadData];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"myCell"];
    cell.textLabel.text=[self.rollArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[self.myArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.nameText.text=cell.detailTextLabel.text;
    self.rollText.text=cell.textLabel.text;
}

- (IBAction)addButton:(id)sender {
    
    NSString *nameText,*rollText;
    
    nameText=self.nameText.text;
    rollText=self.rollText.text;
    NSString *query=[NSString stringWithFormat:@"insert into studTable(roll,name)values(\"%@\",\"%@\")",rollText,nameText];
    int isSuccess=[[DatabaseLib getSharedObject]executeQuery:query];
    if (isSuccess)
    {
        NSLog(@"Inserted Successfully");
        NSString *selquery=@"select * from studTable";
        self.myArray=[[DatabaseLib getSharedObject]getAllTasks:selquery];
        self.rollArray=[[DatabaseLib getSharedObject]getAllTasks1:selquery];
        
        [self.myTableView reloadData];
    }
    else
    {
        NSLog(@"Inserted Failed");
    }
}

- (IBAction)updateButton:(id)sender {
    NSString *nameText,*rollText;
    nameText=self.nameText.text;
    rollText=self.rollText.text;
    NSString *query=[NSString stringWithFormat:@"update studTable set name=\"%@\" where roll=\"%@\"",nameText,rollText];
    int isSuccess=[[DatabaseLib getSharedObject]executeQuery:query];
    if (isSuccess)
    {
        NSLog(@"Updated Successfully");
        NSString *selquery=@"select * from studTable";
        self.myArray=[[DatabaseLib getSharedObject]getAllTasks:selquery];
        self.rollArray=[[DatabaseLib getSharedObject]getAllTasks1:selquery];
        
        [self.myTableView reloadData];
    }
    else
    {
        NSLog(@"Updated Failed");
    }
}


- (IBAction)deleteButton:(id)sender {
    
    NSString *query=[NSString stringWithFormat:@"delete from studTable Where name=\"%@\"",self.nameText.text];
    
    int isSuccess=[[DatabaseLib getSharedObject]executeQuery:query];
    if (isSuccess)
    {
        NSLog(@"Deleted Successfully");
        
        NSString *selquery=@"select * from studTable";
        self.myArray=[[DatabaseLib getSharedObject]getAllTasks:selquery];
        self.rollArray=[[DatabaseLib getSharedObject]getAllTasks1:selquery];
        
        [self.myTableView reloadData];
    }
    else
    {
        NSLog(@"Deleted Failed");
    }

}
@end
