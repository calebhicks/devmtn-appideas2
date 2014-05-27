//
//  AIIdeaDataSource.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListTableViewDataSource.h"

static NSString * const titleKey = @"title";

@interface AIListTableViewDataSource ()

@property (nonatomic, strong) NSArray *ideas;

@end

@implementation AIListTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ideas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

@end
