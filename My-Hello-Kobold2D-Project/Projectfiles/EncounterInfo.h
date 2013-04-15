//
//  EncounterInfo.h
//  KoboldTest
//
//  Created by Rebecca Langer on 13-04-02.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "kobold2d.h"
#import "NPC.h"
#import "CombatLayer.h"

@interface EncounterInfo : NSObject
{
    //Encounter:
    //PlayerSpot 1, 2, 3, 4
    //Enemy 1, 2, 3, 4, 5, 6
    //EnemySpot 1, 2, 3, 4, 5
    //EnemyEntryPoint 1, 2, 3, 4, 5, 6
    //EnemyEntryTrigger 1, 2, 3, 4, 5, 6
    //CameraPosition
    //Dialogue / Scripted events
    
@public    
    CGPoint playerPosition;
    CGPoint enemyPosition;
    CGPoint enemyEntryPosition;
    
    NPC *enemyCombatant;
    
@protected
@private
}

@end
