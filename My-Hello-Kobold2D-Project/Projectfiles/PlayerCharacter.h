//
//  PlayerCharacter.h
//  Lesson1
//
//  Created by Rebecca Langer on 12-08-29.
//  Copyright (c) 2012 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "Character.h"
#import "LinkedLocation.h"
#import "CharStats.h"

@class Model;
@class Global;

typedef enum tagTouchState {
	kTouchStateGrabbed,
	kTouchStateUngrabbed
} TouchState;

@interface PlayerCharacter : Character {
@private
	TouchState state;
    CFMutableDictionaryRef map;

@public
    bool selected;
    NSMutableArray *pathArray;
    LinkedLocation *nextLoc;
    LinkedLocation *lastLoc;
    
    CCLabelTTF *lowEnergyLabel;
    
    CharStats *stats;

}

+ (id)pcWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel;
+ (id)pcWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel andType: (ChType) aType;
- (void)goTo:(CGPoint)target;
- (void) selectPC;
- (Boolean) isReady;
- (void) adjustEnergy:(int)adjustment;
- (bool) hasEnergy:(int)val;
- (void) resetAttack;


@end
