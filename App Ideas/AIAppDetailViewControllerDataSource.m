//
//  AIAppDetailViewControllerDataSource.m
//  App Ideas
//
//  Created by Caleb Hicks on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIAppDetailViewControllerDataSource.h"

@implementation AIAppDetailViewControllerDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    cell.tag = indexPath.row;
    return cell;
}

@end

