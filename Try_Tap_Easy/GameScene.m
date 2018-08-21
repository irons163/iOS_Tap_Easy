//
//  GameScene.m
//  Try_Tap_Easy
//
//  Created by irons on 2015/7/1.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "GameScene.h"
#import "PlayerInfo.h"
#import "ASkil.h"
#import "Skill.h"
#import "TextureHelper.h"
#import "SkillTableViewCell.h"

#define DEFAULT_HP  20

int backgroundLayerZPosition = -3;

int monsterMaxHp = DEFAULT_HP;
int monsterCurrentHp = DEFAULT_HP;

@implementation GameScene{
//    int monsterCurrentHp;
//    int monsterMaxHp;
    
    PlayerInfo* playerInfo;
    ASkil* skill;
    
    SKSpriteNode* monster;
    
    SKTexture * monsterInjure;
    
    SKSpriteNode * skillManagerBtnNode, * heroManagerBtnNode, * storeManagerBtnNode;
    int level;
    
    SKLabelNode* levelLabel;
    SKSpriteNode *explode;
    SKAction *explodeAction;
    bool isDestoringMonster;
}

-(void)initSkill{
    skill = [Skill new];
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    playerInfo = [PlayerInfo new];
    playerInfo.atk = 1;
    
    [self initSkill];
    
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 65;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
    
    monster = [SKSpriteNode spriteNodeWithImageNamed:@"cat01_1"];
    monster.size = CGSizeMake(100, 100);
    monster.position = CGPointMake(300,
                                   CGRectGetMidY(self.frame));
    
    [self addChild:monster];
    
    monsterInjure = [SKTexture textureWithImageNamed:@"cat01_3"];
    
    SKSpriteNode * hpFrame = [SKSpriteNode spriteNodeWithImageNamed:@"hp_frame"];
    
    self.hpBar = [SKSpriteNode spriteNodeWithImageNamed:@"hp_bar"];
    
    self.hpBar.zPosition = backgroundLayerZPosition;
    
    hpFrame.size = CGSizeMake(self.frame.size.width, 42);
    
    hpFrame.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMaxY(self.frame) - hpFrame.size.height/2 - 45);
    
    hpFrame.zPosition = backgroundLayerZPosition;
    
    [self changeCatHpBar];
    
    [self addChild:hpFrame];
    
    [self addChild:self.hpBar];
    
    skillManagerBtnNode = [SKSpriteNode spriteNodeWithImageNamed:@"cat01_1"];
    skillManagerBtnNode.size = CGSizeMake(50, 50);
    skillManagerBtnNode.position = CGPointMake(0, 0);
    skillManagerBtnNode.anchorPoint = CGPointMake(0, 0);
    [self addChild:skillManagerBtnNode];
    
    heroManagerBtnNode = [SKSpriteNode spriteNodeWithImageNamed:@"cat01_1"];
    heroManagerBtnNode.size = CGSizeMake(50, 50);
    heroManagerBtnNode.position = CGPointMake(100, 0);
    heroManagerBtnNode.anchorPoint = CGPointMake(0, 0);
    [self addChild:heroManagerBtnNode];
    
    storeManagerBtnNode = [SKSpriteNode spriteNodeWithImageNamed:@"cat01_1"];
    storeManagerBtnNode.size = CGSizeMake(50, 50);
    storeManagerBtnNode.position = CGPointMake(200, 0);
    storeManagerBtnNode.anchorPoint = CGPointMake(0, 0);
    [self addChild:storeManagerBtnNode];
    
    // Add UITableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,350, self.size.width, 180)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    level = 1;
    levelLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];

    levelLabel.text = [NSString stringWithFormat:@"Level:%d", level];
    levelLabel.fontSize = 55;
    levelLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMaxY(self.frame) - 100);

    [self addChild:levelLabel];
    
//    [TextureHelper initTextures];
    
    explode = [SKSpriteNode spriteNodeWithTexture:nil size:CGSizeMake(100, 100)];
    
    NSArray * nsArray = [TextureHelper getTexturesWithSpriteSheetNamed:@"explode" withinNode:nil sourceRect:CGRectMake(0, 0, 500, 500) andRowNumberOfSprites:1 andColNumberOfSprites:5];
    
    explode.position = monster.position;
    
    SKAction * monsterAnimation = [SKAction animateWithTextures:nsArray timePerFrame:0.2];
    
//    SKAction * actionMoveDone = [SKAction removeFromParent];
    SKAction * actionMoveDone = [SKAction runBlock:^{
        explode.texture = nil;
    }];
    
    explodeAction = [SKAction sequence: @[monsterAnimation, actionMoveDone]];
    
    [self addChild:explode];
    //        [spriteNodesExplode addObject:explode];
}

-(void)changeCatHpBar {
    float hpBarWidth = self.frame.size.width/((float)monsterMaxHp/monsterCurrentHp);
    
    self.hpBar.size = CGSizeMake(hpBarWidth, 42);
    
    self.hpBar.anchorPoint = CGPointMake(0.5, 0.5);
    
    float hpBarOffsetX = self.frame.size.width/10 - hpBarWidth/10;
    
    self.hpBar.position = CGPointMake(CGRectGetMinX(self.frame) + hpBarWidth/2 + hpBarOffsetX,
                                      CGRectGetMaxY(self.frame) - self.hpBar.size.height/2 - 45);
}

-(void)changeLevel{
    levelLabel.text = [NSString stringWithFormat:@"Level:%d", level];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
        
        if(CGRectContainsPoint(skillManagerBtnNode.calculateAccumulatedFrame, location)){
//            if(skill.skillLevel==0)
                [skill upgradeSkillLevel];
            [skill doSkillWithPlayerInfo:playerInfo];
        }else if(CGRectContainsPoint(heroManagerBtnNode.calculateAccumulatedFrame, location)){
            ASkil* skill = [Skill new];
            [skill doSkillWithPlayerInfo:playerInfo];
        }else if(CGRectContainsPoint(storeManagerBtnNode.calculateAccumulatedFrame, location)){
            ASkil* skill = [Skill new];
            [skill doSkillWithPlayerInfo:playerInfo];
        }else {
           [self tapScreen];
        }
    }
}

-(void) tapScreen{
    
    if([self checkIsMonsterHpEmpty] && !isDestoringMonster){
        isDestoringMonster = true;
        [self destoringMonster];
//        [self nextMonster];
        
    }else if(!isDestoringMonster){
        [self hitMonster];
    }
}

-(bool)checkIsMonsterHpEmpty{
    if(monsterCurrentHp>0){
        return false;
    }
    return true;
}

-(void)nextMonster{
    [monster removeFromParent];
//    monster = [SKSpriteNode spriteNodeWithTexture:nil];
    monster = [SKSpriteNode spriteNodeWithImageNamed:@"cat02_1"];
    monster.size = CGSizeMake(100, 100);
//    monster.position = CGPointMake(100, 100);
    monster.position = CGPointMake(300,
                                   CGRectGetMidY(self.frame));
    [self addChild:monster];
}

-(void)destoringMonster{
//    SKSpriteNode *destoring = [SKSpriteNode spriteNodeWithImageNamed:@"cat02_1"];
//    destoring.size = CGSizeMake(100, 100);
//    //    monster.position = CGPointMake(100, 100);
//    destoring.position = CGPointMake(300,
//                                   CGRectGetMidY(self.frame));
//    [self addChild:destoring];
    
//    [destoring runAction:[MAction animateWithTextures:[] timePerFrame:<#(NSTimeInterval)#>]];
    
    
//        [monster removeFromParent];
//        monster.hidden = true;
//        //        monster = nil;
//        NSLog(@"monster hit down");
    

    
        NSLog(@"explode");
    
    monster.hidden = true;

    [explode runAction:[SKAction sequence:@[explodeAction, [SKAction runBlock:^{
        [self nextMonster];
        monsterCurrentHp = monsterMaxHp;
        [self changeCatHpBar];
        isDestoringMonster = false;
    }]]]];
    
}

-(void) hitMonster{
    monster.texture = monsterInjure;
    int atk = playerInfo.atk;
    monsterCurrentHp -= atk;
    [self changeCatHpBar];
}

-(void)changeBg{
    
}

-(void)tapHeroStore{
//    [heroview];
}

-(void)tapSkillStore{
//    [skillview];
}

-(void)tapStore{
//    [buy];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *scoreTableIdentifier = @"PMVScoreTableViewCell";
//    
//    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:scoreTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PMVScoreTableViewCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    cell.highScore.text = [_arrHighScores objectAtIndex:indexPath.row];
//    NSString *strindexPath = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
//    cell.highscoreRank.text = strindexPath; // Start from 1 instead of 0
//    
//    return cell;
    
    static NSString *skillTableIdentifier = @"SkillTableViewCell";
    
    SkillTableViewCell *cell = (SkillTableViewCell *)[tableView dequeueReusableCellWithIdentifier:skillTableIdentifier];
    if (cell == nil)
    {
        cell = [[SkillTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:skillTableIdentifier];
    }
    
//    cell.textLabel.textColor = [UIColor blueColor];
//    cell.textLabel.text = @"123";
    
    cell.skillTitleLabel.textColor = [UIColor redColor];
    cell.skillTitleLabel.text = @"123";
    
    return cell;
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    self.lastSpawnTimeInterval += timeSinceLast;
    
    if (self.lastSpawnTimeInterval > 0.5) {
        self.lastSpawnTimeInterval = 0;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    // 获取时间增量
    // 如果我们运行的每秒帧数低于60，我们依然希望一切和每秒60帧移动的位移相同
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // 如果上次更新后得时间增量大于1秒
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

@end
