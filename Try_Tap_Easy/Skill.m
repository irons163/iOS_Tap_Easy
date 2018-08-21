//
//  Skill.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "Skill.h"

@implementation Skill

-(instancetype)init{
    if(self = [super init]){
        self.coldDownTime = 30;
        self.workTime = 10;
    }
    return self;
}

-(BOOL)doSkillWithPlayerInfo:(PlayerInfo *)playerInfo{
    playerInfo.atk += self.skillLevel;
    return true;
}

-(void)setTheSkillLevel:(int)skillLevel{
    self.skillLevel = skillLevel;
}

@end

