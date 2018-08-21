//
//  GameViewController.h
//  Try_Tap_Easy
//

//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>


@import iAd;

@protocol pauseGameDelegate <NSObject>
- (void)pauseGame;
@end

@interface GameViewController : UIViewController<pauseGameDelegate, ADBannerViewDelegate>


@end
