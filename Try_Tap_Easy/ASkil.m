//
//  ASkil.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "ASkil.h"

@implementation ASkil{
    NSDate *pauseStart, *previousFireDate;
    NSMutableArray * timers;
    
    NSTimer * theGameTimer, * theSkillingTimer;
}

-(instancetype)init{
    if(self = [super init]){
        timers = [NSMutableArray array];
    }
    return self;
}

-(void)upgradeSkillLevel{
    self.skillLevel++;
}

-(void)startSkill{
    self.leftTime = self.coldDownTime;
    
    theGameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                  selector:@selector(count)
                                                  userInfo:nil
                                                   repeats:YES];
    [timers addObject:theGameTimer];
    
    theSkillingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                  selector:@selector(countSkill)
                                                  userInfo:nil
                                                   repeats:YES];
    [timers addObject:theSkillingTimer];
}

-(void)count{
//    if(!isGameRun){
//        return;
//    }
    
    self.leftTime--;
//    selector
    
}

-(void)countSkill{
    //    if(!isGameRun){
    //        return;
    //    }
    
    self.leftTime--;
    
}

-(void)pause{
    pauseStart = [NSDate dateWithTimeIntervalSinceNow:0];
    for (int i = 0; i < timers.count; i++) {
        //            [timers[i] invalidate];
        NSTimer * t = timers[i];
        previousFireDate = [t fireDate];
        [t setFireDate:[NSDate distantFuture]];
    }
}

-(void)resume{
    float pauseTime = -1*[pauseStart timeIntervalSinceNow];
    for (int i = 0; i < timers.count; i++) {
        NSTimer * t = timers[i];
        [t setFireDate:[NSDate dateWithTimeInterval:pauseTime sinceDate:previousFireDate]];
    }
}

@end
