//
//  EmptyViewController.h
//  DemoEmptyView
//
//  Created by Mahsa on 6/15/15.
//  Copyright (c) 2015 engMahsa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyViewController : UIViewController


/** this method call at child classes and would fill the dictionary up with the appropriate information (emptyViewImageName,emptyViewlabelText)*/
-(void)setSourceDictionary:(NSMutableDictionary*)emptyViewDic;

@property(nonatomic,strong)NSMutableDictionary *emptyViewDictionary;

@end
