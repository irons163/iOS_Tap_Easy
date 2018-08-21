//
//  Hero.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "Hero.h"

const int speed;

@implementation Hero

-(void)setHeroInfo:(HeroInfo *)heroInfo{
    
}

-(void)setLevel:(int)level{
    self.level = level;
}

-(void)upgradeLevel{
    self.level++;
}

-(bool)attack{
    return true;
}

-(int)getAtk{
    return self.atk;
}

@end
