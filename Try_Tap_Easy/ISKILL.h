//
//  ISKILL.h
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerInfo.h"

@protocol ISKILL<NSObject>

-(BOOL)doSkillWithPlayerInfo:(PlayerInfo*)playerInfo;
-(BOOL)start;

@end

