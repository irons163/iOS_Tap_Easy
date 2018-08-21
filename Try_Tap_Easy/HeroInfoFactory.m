//
//  HeroInfoFactory.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/7.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "HeroInfoFactory.h"

@implementation HeroInfoFactory

+(HeroInfo*)createHeroInfoA{
    HeroInfo* heroInfo = [HeroInfo new];
    heroInfo.atk = 2;
    return heroInfo;
}

@end
