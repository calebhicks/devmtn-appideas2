//
//  AIAppDetailViewControllerDataSource.h
//  App Ideas
//
//  Created by Caleb Hicks on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIAppDetailViewControllerDataSource : NSObject <UITableViewDataSource>

- (void)newVoice;
- (void)registerTableView:(UITableView *)tableView;

@property (nonatomic, strong) NSDictionary *idea;

@end
