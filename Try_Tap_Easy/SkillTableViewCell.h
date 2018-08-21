//
//  SkillTableViewCell.h
//  Try_Tap_Easy
//
//  Created by irons on 2016/4/13.
//  Copyright (c) 2016年 irons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *skillImageView;
@property (strong, nonatomic) IBOutlet UILabel *skillTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *skillIncreaseButton;
@end
