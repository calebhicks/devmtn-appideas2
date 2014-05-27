//
//  AIIdeaDataSource.m
//  App Ideas
//
//  Created by Joshua Howland on 5/26/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIListTableViewDataSource.h"
#import "AIListTableViewCell.h"

static NSString * const ListCellKey = @"listCell";

@interface AIListTableViewDataSource ()

@property (nonatomic, strong) NSArray *ideas;

@end

@implementation AIListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[AIListTableViewCell class] forCellReuseIdentifier:ListCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ideas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListCellKey];
    [cell updateWithIdea:self.ideas[indexPath.row]];
    return cell;
}

- (void)newIdea {
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithObject:[NSDictionary new]];
    [mutableIdeas addObjectsFromArray:self.ideas];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

@end
