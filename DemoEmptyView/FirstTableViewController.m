//
//  FirstTableViewController.m
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"plus"] style:(UIBarButtonItemStylePlain) target:self action:@selector(addTableViewCell)];
    self.dataSource = [[NSMutableArray alloc] init];
    
    // A trick for removing the cell separators
    self.tableView.tableFooterView = [UIView new];
    
    /**at each tableViewController which we want to insert empty view ,we set a dictionary of empty values to fill the view . the dictionary contains two keys and values value(0):name of empty image view for key :"image", value(1):text of empy view label for key:"text" . I've put it at view didload to fill the dictionary once for each of these view controllers : one-to-one history, group history,channel history, contacts , new message, group and contact pickers
     */
    NSMutableDictionary *emptyViewInfo = [[NSMutableDictionary alloc] init];
    
        [emptyViewInfo setValue:@"emptyView" forKey:@"image"];
        [emptyViewInfo setValue:@"TableView is empty. Tap the rightBarButtonItem to insert row in the table view." forKey:@"text"];
    [self setSourceDictionary:emptyViewInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
     cell.textLabel.text = @"Swipe Cell to delete.➔";
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Delete";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        if (![tableView cellForRowAtIndexPath:indexPath]){
            return;
        }
        [self.dataSource removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)addTableViewCell{
    [self.dataSource insertObject:@"test" atIndex:self.dataSource.count];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.dataSource.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView reloadData];
}


@end
