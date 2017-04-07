//
//  ViewController.h
//  Day25_studentApp
//
//  Created by Student 12 on 4/4/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *marksLabel;
//@property (strong, nonatomic) IBOutlet UITextField *nameText;
//@property (strong, nonatomic) IBOutlet UITextField *marksText;
@property (weak, nonatomic) IBOutlet UITextField *rollText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;

- (IBAction)addButton:(id)sender;
- (IBAction)updateButton:(id)sender;

- (IBAction)deleteButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *myArray;
@property NSArray *rollArray;


















@end

