//
//  AIAppDetailViewController.m
//  App Ideas
//
//  Created by Caleb Hicks on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIAppDetailViewController.h"
#import "AIAppDetailViewControllerDataSource.h"

static NSString * const titleKey = @"title";

@interface AIAppDetailViewController ()

@property (nonatomic, strong) AIAppDetailViewControllerDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation AIAppDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.dataSource = [AIAppDetailViewControllerDataSource new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.title;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self.dataSource;
    tableView.delegate = self;
    tableView.rowHeight = 120;
    self.tableView = tableView;
    [self.view addSubview:tableView];

    [self.dataSource registerTableView:tableView];
    
    
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newVoice)];
    self.navigationItem.rightBarButtonItem = plusButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newVoice {
    
    [self.dataSource newVoice];
    [self.tableView reloadData];
}

- (void)updateWithIdea:(NSDictionary *)idea {
    self.idea = idea;
    self.dataSource.idea = idea;
    
    self.title = idea[titleKey];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
