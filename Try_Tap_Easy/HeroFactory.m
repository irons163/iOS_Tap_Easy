//
//  HeroFactory.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/7.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "HeroFactory.h"

@implementation HeroFactory

+(Hero*)createHeroA{
    Hero* hero = [Hero new];
    [hero setHeroInfo:[HeroInfoFactory createHeroInfoA]];
    [hero upgradeLevel];
    return hero;
    
    
    
    
}

+(Hero*)createHeroB{
    Hero* hero = [Hero new];
    [hero setHeroInfo:[HeroInfoFactory createHeroInfoA]];
    [hero upgradeLevel];
    return hero;
}

+(Hero*)createHeroC{
    Hero* hero = [Hero new];
    [hero setHeroInfo:[HeroInfoFactory createHeroInfoA]];
    [hero upgradeLevel];
    return hero;
}

@end
