//
//  AIAppDetailTableViewCell.m
//  App Ideas
//
//  Created by Caleb Hicks on 5/29/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "AIAppDetailTableViewCell.h"

static CGFloat margin = 15;

static NSString * const userNameKey = @"userName";
static NSString * const titleKey = @"title";
static NSString * const scoreKey = @"score";


@interface AIAppDetailTableViewCell ()

@property (nonatomic, strong) UITextField *userName;

@property (nonatomic, strong) UIButton *wouldUseButton;
@property (nonatomic, strong) UIButton *mightUseButton;
@property (nonatomic, strong) UIButton *wontUseButton;

@property (nonatomic, strong) NSString *voiceDetailKey;
@property (nonatomic, strong) NSDictionary *voiceDetail;

@end

@implementation AIAppDetailTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, self.contentView.bounds.size.width - (3 * margin) - 100, self.contentView.bounds.size.height)];
        textField.placeholder = @"User Name";
        self.userNameField = textField;
        [self.contentView addSubview:textField];
        
        UIButton *wouldUse = [UIButton buttonWithType:UIButtonTypeCustom];
        [wouldUse setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        wouldUse.frame = CGRectMake(self.frame.size.width-100, 0, 100, 40);
        wouldUse.tag = 3;
        [wouldUse setTitle:@"Would Use" forState:UIControlStateNormal];
        [wouldUse addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wouldUse];
        
        self.wouldUseButton = wouldUse;
        
        UIButton *mightUse = [UIButton buttonWithType:UIButtonTypeCustom];
        [mightUse setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        mightUse.frame = CGRectMake(self.frame.size.width-100, 40, 100, 40);
        mightUse.tag = 2;
        [mightUse setTitle:@"Might Use" forState:UIControlStateNormal];
        [mightUse addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:mightUse];

        
        self.mightUseButton = mightUse;
        
        UIButton *wontUse = [UIButton buttonWithType:UIButtonTypeCustom];
        [wontUse setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        wontUse.frame = CGRectMake(self.frame.size.width-100, 80, 100, 40);
        wontUse.tag = 1;
        [wontUse setTitle:@"Won't Use" forState:UIControlStateNormal];
        [wontUse addTarget:self action:@selector(scoreButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:wontUse];

        self.wontUseButton = wontUse;
        
    }
    return self;
}

- (void)updateWithVoice:(NSDictionary *)voice idea:(NSDictionary *)idea {
    self.userNameField.text = voice[userNameKey];
    
    self.voiceDetailKey = [NSString stringWithFormat:@"%@-%@", idea[titleKey], voice[userNameKey]];
    self.voiceDetail = [[NSUserDefaults standardUserDefaults] objectForKey:self.voiceDetailKey];
    
    [self updateScore:[self.voiceDetail[scoreKey] integerValue]];
    
}

- (void)scoreButtonSelected:(id)sender {
    [self updateScore:[sender tag]];
    
    NSMutableDictionary *voiceDetail = [[NSMutableDictionary alloc] initWithDictionary:self.voiceDetail];
    [voiceDetail setObject:@([sender tag]) forKey:scoreKey];
    
    [[NSUserDefaults standardUserDefaults] setObject:voiceDetail forKey:self.voiceDetailKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)updateScore:(NSInteger)score {
    
    [self resetButtons];
    
    if (score == 1) {
        [self.wontUseButton setBackgroundColor:[UIColor redColor]];
        [self.wontUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 2) {
        [self.mightUseButton setBackgroundColor:[UIColor yellowColor]];
        [self.mightUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (score == 3) {
        [self.wouldUseButton setBackgroundColor:[UIColor greenColor]];
        [self.wouldUseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
}

- (void)resetButtons {
    
    [self.wouldUseButton setBackgroundColor:[UIColor whiteColor]];
    [self.mightUseButton setBackgroundColor:[UIColor whiteColor]];
    [self.wontUseButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.wouldUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.mightUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wontUseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithFeedback:(NSString *)username
{
    self.userName.text = username;
}

@end
