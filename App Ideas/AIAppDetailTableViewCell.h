//
//  AIAppDetailTableViewCell.h
//  App Ideas
//
//  Created by Caleb Hicks on 5/29/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIAppDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *userNameField;

- (void)updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea;

@end
