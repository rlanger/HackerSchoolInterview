//
//  SceneModel.h
//  Lesson1
//
//  Created by Rebecca Langer on 12-09-03.
//  Copyright (c) 2012 University of Waterloo. All rights reserved.
//

#import "CCNode.h"
#import "PlayerCharacter.h"
#import "NPC.h"
#import "Constants.h"
#import "CCSequence+Helper.h"
//#import "MainMenu.h"
//#import "RangedAttack.h"
#import "Model.h"
#import "PlayerCharacter.h"
#import "NPC.h"
#import "cocos2d.h"
#import "FoodSprite.h"
#import "Door.h"
#import "CombatView.h"

@class EncounterInfo;
@class Global;

@interface CombatModel : Model{
@public
    CombatView *view;
    NSArray *pcs;
    NSMutableArray *npcs;
    NSMutableArray *foods;
    NSMutableArray *doors;
    NSMutableArray *monsters;
    NSMutableArray *attackSprites;
    int mode;
    int exploration_submode;
    int flocking_behaviour;
    double startTime;
    double timeElapsed;
    bool timedLevel;
    float timeSinceLastMonster;
    float monsterSpawnRate;
    EncounterInfo *encounter;
    
}
+ (CombatModel*)modelWithView:(CombatView *)aView;
- (void)addToView:(CCNode *)aNode;
- (CombatView *) getView;
- (void)pcMoved:(PlayerCharacter *)pc byTouch:(UITouch *)touch;
- (void)pcDrag: (UITouch *)touch;
- (void) moveSelectedTo: (UITouch *)touch;
- (void) deselectPCs;
- (void) pcFollowPath: (PlayerCharacter *)pc;
- (void) setCombatSubmode:(int)newMode;
- (void) setFlockingBehaviour:(int)newMode;
- (PlayerCharacter *) findClosestPC:(NPC *)monster;
- (NPC *) monsterTouched: (UITouch *) touch;
- (PlayerCharacter *) pcTouched: (UITouch *) touch;
- (void) npcDead: (NPC *)monster;
- (bool) targetedBySelected: (NPC *)monster;
-(CGPoint) avoidOtherNPCs:(NPC *)monster;
- (PlayerCharacter *) getTouchedPC: (UITouch *) touch;
- (PlayerCharacter *) selectedPC;
- (void) processTouches: (NSSet *)touches;

@end
