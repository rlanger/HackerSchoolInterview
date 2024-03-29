//
//  PlayerCharacter.m
//  Lesson1
//
//  Created by Rebecca Langer on 12-08-29.
//  Copyright (c) 2012 University of Waterloo. All rights reserved.
//

#import "PlayerCharacter.h"
#import "Model.h"
#import "NPC.h"
#import "cocos2d.h"
#import "Global.h"

@implementation PlayerCharacter

+ (id)pcWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel
{
	return [[self alloc] initWithTexture:aTexture andModel:aModel];
}

+ (id)pcWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel andType: (ChType) aType
{
	return [[self alloc] initWithTexture:aTexture andModel:aModel andType:aType];
}

- (id)initWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel
{
	return [self initWithTexture:aTexture andModel:aModel andType:MELEE_PC];
}

- (id)initWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel andType: (ChType) aType
{
	if ((self = [super initWithTexture:aTexture andModel:aModel andType:aType]) ) {
        
        pathArray = [[NSMutableArray alloc] init];
        
		state = kTouchStateUngrabbed;

        destination = self.position;
        //NSLog(@"destination: %f, %f", destination.x, destination.y);
        //NSLog(@"self.position: %f, %f", self.position.x, self.position.y);
        
        selected = FALSE;
        
        
        LinkedLocation *newLoc = [LinkedLocation linkedLocationWithX:destination.x andY: destination.y];
        
        nextLoc = newLoc;
        lastLoc = newLoc;
        
        
        
        Global *sharedState = [Global sharedState];
        
        stats = [sharedState protagonist];
        
        lowEnergyLabel = [[CCLabelTTF alloc] initWithString:@"Low Energy" fontName:@"Helvetica" fontSize:12];
        [lowEnergyLabel setPosition:ccp(20, 20)];
        [lowEnergyLabel setVisible:FALSE];
        [self addChild:lowEnergyLabel];
        
        
	}
    
	return self;
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
	if (state != kTouchStateUngrabbed) return NO;
    
    state = kTouchStateGrabbed;
    [model deselectPCs];
    selected = TRUE;
    
    if ( ![self containsTouchLocation:touch] ){
        //target = [model monsterTouched:touch];
        //NSLog(@"ATTAAAAAAACK");
        //return YES;
    }
    
    return NO;
}

    /*destination = [self convertTouchToNodeSpace:touch];
	
    if ( ![self containsTouchLocation:touch] ){
        if (model->combat_submode==TAP_DESTINATION && selected==TRUE) {
            
            if ([model pcTouched:touch]) {
                return NO;
            }
            
            target = [model monsterTouched:touch];
            
            destination = [self convertToWorldSpace:destination];
//            [model pcMoved:self byTouch:touch];
            [self moveTowardsDestination];
            return YES;
        }
        return NO;
    }
    

    
    if (model->combat_submode==DRAG_PATH_WAIT) {
        // clear prior path, free memory
        [nextLoc releaseChain];
        
        //CGPoint locPoint = [touch locationInView: [touch view]];
        //CGPoint glPoint = [[CCDirector sharedDirector] convertToGL:locPoint];
        
        LinkedLocation *newLoc = [LinkedLocation linkedLocationWithX: destination.x andY: destination.y];
        
        nextLoc = newLoc;
        lastLoc = newLoc;
        
        NSLog(@"Touch Began");
    }
    
    return YES;

}*/

/*
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	// If it weren't for the TouchDispatcher, you would need to keep a reference
	// to the touch from touchBegan and check that the current touch is the same
	// as that one.
	// Actually, it would be even more complicated since in the Cocos dispatcher
	// you get NSSets instead of 1 UITouch, so you'd need to loop through the set
	// in each touchXXX method.
    
	NSAssert(state == kTouchStateGrabbed, @"PC - Unexpected state!");

    //destination = [touch locationInView:[touch view]];
	destination = [self convertTouchToNodeSpace:touch];  
    
    [model pcDrag:touch];
    
    if (model->combat_submode==DRAG_DESTINATION_WAIT) {
        target = [model monsterTouched:touch];
    }
    
    if (model->combat_submode==DRAG_DIRECTION) {
        [model pcMoved:self byTouch:touch];
    }
    
    if (model->combat_submode==DRAG_PATH_WAIT) {
/*      CGPoint newPoint = [self convertTouchToNodeSpace:touch];
        [pathArray addObject:[NSValue valueWithCGPoint:newPoint]];
        NSLog(@"Added touch (array size %d)", [pathArray count]);*/
 /*       NSLog(@"Touch Moved");

        if (lastLoc != NULL) {
            LinkedLocation *newLoc = [LinkedLocation linkedLocationWithX: destination.x andY: destination.y];
            
            NSLog(@"lastLoc = %@", lastLoc);
            NSLog(@"newLoc = %@", newLoc);
            
            [lastLoc setNext:newLoc];
            lastLoc = newLoc;
            
            NSLog(@"New Loc");
        }
                
    }
    
    if (model->combat_submode == TAP_DESTINATION) {
        //[model moveSelectedTo:touch];
        destination = [self convertTouchToNodeSpace:touch];
//        [model pcMoved:self byTouch:touch];
        
        target = [model monsterTouched:touch];

    }
    
}*/

/*
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    //int test = [model testVal];
    
	NSAssert(state == kTouchStateGrabbed, @"PC - Unexpected state!");
    
    state = kTouchStateUngrabbed;
    
    if ( ![self containsTouchLocation:touch] && model->combat_submode==DRAG_DESTINATION_WAIT)
    {
        target = [model monsterTouched:touch];
        if (target == NULL) {
            [model pcMoved:self byTouch:touch];
        }

    }
    
    if ( ![self containsTouchLocation:touch] && model->combat_submode==DRAG_PATH_WAIT)
    {
        NSLog(@"Follow Path...");
        //[model pcFollowPath:self];
        while (nextLoc != lastLoc) {
            //destination.x = nextLoc->x;
            //destination.y = nextLoc->y;
            NSLog(@"next != last");
            [model pcFollowPath:self];
            
        }
        
    }
    
    if (model->combat_submode == TAP_DESTINATION) {
        //[model moveSelectedTo:touch];
        destination = [self convertTouchToNodeSpace:touch];
//        [model pcMoved:self byTouch:touch];
        
        target = [model monsterTouched:touch];
        
    }
    
}*/


-(void)draw{
    
    
    [self drawHealthBar];
    
    ccDrawColor4B(255, 255, 0, 255);
    
    if (selected) {
        [self drawSelectionBox];
    }
    
    if (ready) {
        [self drawReadyBox];
    }
        
    
    CGRect r = [self rect];

    /*
    if (model->combat_submode==DRAG_DESTINATION_WAIT){
        if (ccpDistance(self.position, destination)!=0 && state==kTouchStateGrabbed) {
            ccDrawLine(ccp(r.size.width/2,0), destination);
            
        }
    }
    
    if (model->combat_submode==DRAG_PATH_WAIT) {
        LinkedLocation *loc = nextLoc;
        while(loc != lastLoc){
            ccDrawLine(ccp(loc->x, loc->y), ccp(loc->next->x, loc->next->y));
            loc = loc->next;
        }
    }*/
    [self drawEnergyBar];
        
    [super draw];

}

- (void) drawHealthBar
{
    if(cType != OBJECT){
        CGRect r = [self rect];
        glLineWidth(5.0);
        
        ccDrawColor4B(0, 0, 0, 255);
        //ccDrawLine(ccp(0,r.size.height), ccp(r.size.width,r.size.height));
        ccDrawLine(ccp(r.size.width/2-25, r.size.height), ccp(r.size.width/2+25, r.size.height));
        
        ccDrawColor4B(0, 255, 0, 255);
        //float healthBar = r.size.width*(hp/hpMax);
        //ccDrawLine(ccp(0,r.size.height), ccp(healthBar,r.size.height));
        
        float healthBar = 50*(stats->hp/stats->hpMax);

        
        ccDrawLine(ccp(r.size.width/2-25, r.size.height), ccp((r.size.width/2-25)+healthBar, r.size.height));
    }
}

- (void) drawEnergyBar {
    if(cType != OBJECT){
        CGRect r = [self rect];
        glLineWidth(5.0);
        
        ccDrawColor4B(0, 0, 0, 255);
        //ccDrawLine(ccp(0,r.size.height), ccp(r.size.width,r.size.height));
        ccDrawLine(ccp(r.size.width/2-25, r.size.height+5), ccp(r.size.width/2+25, r.size.height+5));
        
        ccDrawColor4B(0, 255, 255, 255);
        //float healthBar = r.size.width*(hp/hpMax);
        //ccDrawLine(ccp(0,r.size.height), ccp(healthBar,r.size.height));
        
        float energyBar = 50*(stats->energy/stats->energyMax);
        
        ccDrawLine(ccp(r.size.width/2-25, r.size.height+5), ccp((r.size.width/2-25)+energyBar, r.size.height+5));
        
        
        if (energyBar < 10) {
            [lowEnergyLabel setVisible:TRUE];
        } else {
            [lowEnergyLabel setVisible:FALSE];
        }


    }
    
}

- (void) adjustEnergy:(int)adjustment{
    [stats adjustEnergy:adjustment];
    
}

- (void)adjustHP:(int)adjustment
{
    [stats adjustHealth:adjustment];
}

- (void)goTo:(CGPoint)pcDest
{
    destination = pcDest;
    
    [self runAction:[CCMoveTo actionWithDuration:ccpDistance(self.position, destination)/500 position:destination]];
}


- (void)engageTarget
{
    if (cType == MELEE_PC && target != NULL) {
        [self calculateVelocity];
        self.position = ccp(self.position.x + velocity.x, self.position.y + velocity.y);
    }
    if (target == NULL)
    {
        //[self calculateVelocityTo:destination];
        //NSLog(@"destination: %f, %f", destination.x, destination.y);
        //NSLog(@"self.position: %f, %f", self.position.x, self.position.y);
        //NSLog(@"velocity: %f, %f", velocity.x, velocity.y);
        //self.position = ccp(self.position.x + velocity.x, self.position.y + velocity.y);
    }
}

- (void)attackTarget
{
    float distToTarget = ccpDistance(target.position, self.position);

    if (cType == MELEE_PC) {
        //if next to PC, attack
        if (distToTarget < 100){
                [self damageTarget];
        }
    }
    
    if (cType == RANGED_PC) {
        //if within 750 of PC, attack
        if (distToTarget < 750){
            //[model rangedAttackBy:self On:target];
            [self damageTarget];
        }
    }
    
}

- (void) moveTowardsDestination
{
    
    [self goTo:destination];
    //[self calculateVelocityTo:destination];
    //self.position = ccp(self.position.x + velocity.x, self.position.y + velocity.y);
    //NSLog(@"Destination: %f, %f", destination.x, destination.y);

    
}

- (void) selectPC
{
    [model deselectPCs];
    selected = TRUE;
}

- (Boolean) isReady
{
    return ready;
}

- (void)update:(ccTime)dt {
    
    if (stats->allergicReaction) {
        [stats adjustHealth:-1];
    }
    
    if (stats->intoleranceReaction) {
        [stats adjustEnergy:-1];
    }
    
    timeSinceLastAttack = timeSinceLastAttack+dt;
    
    if (timeSinceLastAttack > attackSpeed) {
        ready = TRUE;
    }
    
    [super update:dt];
    
}

- (bool) hasEnergy:(int)val{
    if (stats->energy>=val) {
        return TRUE;
    }
    else return FALSE;
}

- (void) resetAttack
{
    ready = FALSE;
    timeSinceLastAttack = 0;
    
}

@end
