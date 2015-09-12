//
//  EmptyTableViewController.m
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import "EmptyTableViewController.h"
#import "EmptyViewXIB.h"
#import "CustomTable.h"

@interface EmptyTableViewController ()
@property (nonatomic,strong) CustomTable *myTable;
@property (nonatomic,strong) EmptyViewXIB *emptyView;

@end

@implementation EmptyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.emptyViewDictionary = [[NSMutableDictionary alloc] init];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showEmptyview{
    self.emptyView = [[[NSBundle mainBundle] loadNibNamed:@"EmptyView" owner:self options:nil] objectAtIndex:0];
    self.emptyView.imageView.image = [UIImage imageNamed:[self.emptyViewDictionary valueForKey:@"image"]];
    self.emptyView.text.text = [NSString stringWithFormat:@"%@",[self.emptyViewDictionary valueForKey:@"text"]];
    
    self.tableView.backgroundView = self.emptyView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.emptyView.frame = self.view.bounds;
    
}
-(void)hideEmptyview{
    self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

-(void)setSourceDictionary:(NSMutableDictionary*)emptyViewDic{
    
    self.emptyViewDictionary = [emptyViewDic mutableCopy];
    
}

@end
