//
//  EmptyViewController.m
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import "EmptyViewController.h"
#import "EmptyViewXIB.h"
#import "CustomTable.h"

@interface EmptyViewController ()
@property (nonatomic,strong) CustomTable *myTable;
@property (nonatomic,strong) EmptyViewXIB *emptyView;

@end

@implementation EmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emptyViewDictionary = [[NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showEmptyview{
    self.emptyView = [[[NSBundle mainBundle] loadNibNamed:@"EmptyView" owner:self options:nil] objectAtIndex:0];
    self.emptyView.imageView.image = [UIImage imageNamed:[self.emptyViewDictionary valueForKey:@"image"]];
    self.emptyView.text.text = [NSString stringWithFormat:@"%@",[self.emptyViewDictionary valueForKey:@"text"]];
    [self.view addSubview:self.emptyView];
    self.emptyView.frame = self.view.bounds;
}

-(void)hideEmptyview{
    
    [self.emptyView performSelectorOnMainThread:@selector(removeFromSuperview) withObject:nil waitUntilDone:NO];
}

-(void)setSourceDictionary:(NSMutableDictionary*)emptyViewDic{
    
    self.emptyViewDictionary = [emptyViewDic mutableCopy];
    
}


@end
