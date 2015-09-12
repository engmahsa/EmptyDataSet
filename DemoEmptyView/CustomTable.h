//
//  CustomTable.h
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import <UIKit/UIKit.h>


/** "customTableDelegate" has been set to update view after updating tableView dataSource
 */
@protocol CustomTableDelegate <NSObject>
@required


/** this delegate call if the table numberOfRow return 0 and set the custom view to tableViewBackground*/
- (void)showEmptyview;

/** this delegate call if the table numberOfRow is upper than 0 and set nil to tableViewBackground*/
-(void)hideEmptyview;
@end


@interface CustomTable : UITableView
{
    id<CustomTableDelegate> delegate;
}

@end
