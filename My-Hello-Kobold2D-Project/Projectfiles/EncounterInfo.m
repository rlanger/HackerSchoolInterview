//
//  EncounterInfo.m
//  KoboldTest
//
//  Created by Rebecca Langer on 13-04-02.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EncounterInfo.h"

@interface EncounterInfo (PrivateMethods)
// declare private methods here
@end

@implementation EncounterInfo

-(id) init
{
	self = [super init];
	if (self)
	{
		//npcs = [[NSMutableArray alloc] initWithCapacity:1];
        
        [self setEncounterInfo];
        
        CCTexture2D *monsterTexture = [[CCTextureCache sharedTextureCache] addImage:@"tinymonster.png"];
        
        //global/scene tracker -> get model?
        
        
        CCScene* runningScene = [CCDirector sharedDirector].runningScene;
        if ([runningScene isKindOfClass:[CombatLayer class]])
        {
            CombatLayer* cScene = (CombatLayer*)runningScene;
            
            NPC *monster = [NPC npcWithTexture:monsterTexture andModel:cScene->model andType:MELEE_MONSTER];
            
            monster.position = enemyEntryPosition;
            
            enemyCombatant = monster;

        }
        else
        {
            // error handling here, or ignore
        }
                
        
        //[npcs addObject:monster];

	}
	return self;
}

// scheduled update method
-(void) update:(ccTime)delta
{
}

-(void) setEncounterInfo
{
    
    playerPosition = CGPointMake(200, 200);
    enemyPosition = CGPointMake(600, 400);
    enemyEntryPosition = CGPointMake(600, 400);
    
}

@end
