//
//  AIAppDetailViewController.h
//  App Ideas
//
//  Created by Caleb Hicks on 5/28/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIAppDetailViewController : UIViewController <UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSDictionary *idea;

- (void)updateWithIdea:(NSDictionary *)idea;

@end
