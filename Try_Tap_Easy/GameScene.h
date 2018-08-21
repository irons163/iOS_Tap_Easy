//
//  GameScene.h
//  Try_Tap_Easy
//

//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;

@property UITableView* tableView;
@property (nonatomic) SKSpriteNode * hpBar;

@end
