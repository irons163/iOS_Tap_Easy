//
//  Hero.h
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HeroInfo.h"

@interface Hero : SKSpriteNode

-(void)setLevel:(int) level;
-(void)upgradeLevel;
-(bool)attack;
-(int)getAtk;
-(void)setHeroInfo:(HeroInfo*)heroInfo;

@property int atk;
@property (nonatomic) int level;

@end
