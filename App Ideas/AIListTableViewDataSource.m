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
static NSString * const PersistentListKey = @"presistentList";

static NSString * const TitleKey = @"Title";

@interface AIListTableViewDataSource () <UITextFieldDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *ideas;

@end

@implementation AIListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[AIListTableViewCell class] forCellReuseIdentifier:ListCellKey];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ideas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AIListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListCellKey];
    cell.titleField.tag = indexPath.row;
    cell.titleField.delegate = self;
    [cell updateWithIdea:self.ideas[indexPath.row]];
    return cell;
}

- (id)init{
    self = [super init];
    
    self.ideas = [[NSUserDefaults standardUserDefaults] arrayForKey:PersistentListKey];
    
    
    return self;
}

- (void)setIdeas:(NSArray *)ideas{
    _ideas = ideas;
    [[NSUserDefaults standardUserDefaults] setObject:ideas forKey:PersistentListKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)newIdea {
    
    // In order to save the cell if still editing we need to resign the responder and have the delegate methods called. So we reload the tableview before adding another idea
    [self.tableView reloadData];
    
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithObject:@{TitleKey:@""}];
    [mutableIdeas addObjectsFromArray:self.ideas];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    NSInteger index = textField.tag;
    
    NSMutableDictionary *idea = [[NSMutableDictionary alloc]initWithDictionary:self.ideas[index]];
    [idea setObject:textField.text forKey:TitleKey];
    
    NSMutableArray *mutableIdeas = [NSMutableArray arrayWithArray:self.ideas];
    [mutableIdeas replaceObjectAtIndex:index withObject:idea];
    self.ideas = [NSArray arrayWithArray:mutableIdeas];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
