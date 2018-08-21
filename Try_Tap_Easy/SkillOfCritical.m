//
//  SkillOfCritical.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "SkillOfCritical.h"

@implementation SkillOfCritical

-(BOOL)doSkillWithPlayerInfo:(PlayerInfo *)playerInfo{
    playerInfo.criticalChance = self.skillLevel*0.1;
    return true;
}

@end
