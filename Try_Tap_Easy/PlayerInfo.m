//
//  PlayerInfo.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "PlayerInfo.h"

@implementation PlayerInfo

-(int)getAtackNumber{
    int atk = self.atk * self.atkFactor;
    return atk;
}


@end
