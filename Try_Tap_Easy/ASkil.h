//
//  ASkil.h
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISKILL.h"

@interface ASkil : NSObject<ISKILL>

@property int skillLevel;
@property float coldDownTime;
@property float leftTime;
@property float workTime;

-(void)startSkill;
-(void)setTheSkillLevel:(int)skillLevel;
-(void)upgradeSkillLevel;
-(void)pause;
-(void)resume;

@end
