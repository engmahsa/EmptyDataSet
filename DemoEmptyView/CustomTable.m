//
//  CustomTable.m
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import "CustomTable.h"


@interface CustomTable ()

@end

@implementation CustomTable


- (void)reloadData {
    [super reloadData];
    bool empty=YES;
    for(int i=0; i< self.numberOfSections;i++){
        
        if ([self.dataSource tableView:self numberOfRowsInSection:i] > 0 ) {
            empty = NO;
            break;
        }
    }
    if(empty==NO){
        if ([self.delegate respondsToSelector:@selector(hideEmptyview)]) {
            [self.delegate performSelector:@selector(hideEmptyview)];
        }
    }
    
    else{
        if ([self.delegate respondsToSelector:@selector(showEmptyview)]) {
            [self.delegate performSelector:@selector(showEmptyview)];
        }
    }
    
}



@end


