//
//  SceneView.m
//  Lesson1
//
//  Created by Rebecca Langer on 12-09-03.
//  Copyright (c) 2012 University of Waterloo. All rights reserved.
//

#import "CombatView.h"
#import "SceneManager.h"

#import "PauseLayer.h"

@implementation CombatView
// scene has PlayerParty, NPCs, etc
// update ViewNode

+ (CombatView *) newView: (CombatLayer *) aLayer
{
	return [[self alloc] initView: aLayer];
}

// on "init" you need to initialize your instance
-(CombatView *) initView: (CombatLayer *) aLayer
{
    if( (self=[super init] )) {
        
        layer = aLayer;
        
        // Middle Layer
        midLayer = [CCLayer new];
        // change the transform anchor point (optional)
        midLayer.anchorPoint = ccp(0,0);
        
        
        // Background layer: another image
        CCSprite *background = [CCSprite spriteWithFile:@"saint-petersburg.jpg"];
        
        // scale the image (optional)
        background.scale = 1.0f;
        // change the transform anchor point (optional)
        background.anchorPoint = ccp(0,0);
        
        // create a void node, a parent ParallaxNode
        CCParallaxNode *voidNode = [CCParallaxNode node];
        
        // NOW add the 3 layers to the 'void' node
        
        // background image is moved at a ratio of 0.4x, 0.5y
        [voidNode addChild:background z:-1 parallaxRatio:ccp(0.1f,0.1f) positionOffset:ccp(0, 0)];
        //positionOffset:CGPointZero
        
        // midLayer is moved at a ratio of 1.0, 1.0y
        [voidNode addChild:midLayer z:1 parallaxRatio:ccp(1.0f,1.0f) positionOffset:ccp(0,0)];
        
        // ParallaxNode is added to view with tag kTagNode
        [self addChild:voidNode z:0 tag:kTagNode];
        
        
        [self addModeMenu];
        
        //self.isTouchEnabled = YES;
        
    }
    
    return self;
}

- (void)onEnter
{
	/*CCDirector *director =  [CCDirector sharedDirector];
     
     [[director touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];*/
	[super onEnter];
    
}

- (void)onExit
{
	CCDirector *director = [CCDirector sharedDirector];
    
	[[director touchDispatcher] removeDelegate:self];
    
    [self removeAllChildrenWithCleanup:YES];
    
	[super onExit];
    
    //Remove self as touch delegate to sharedDispatcher?
}

- (void)addModeMenu
{    
    // Add the menu to the layer
    
    CCMenuItemFont *m_inventory = [CCMenuItemFont itemWithString: @"Inventory" block:^(id sender){
        NSLog(@"GO TO INVENTORY");
        
        [SceneManager pushInventoryLayer];
    }];
    
    /*CCMenuItemFont *m_otherworld = [CCMenuItemFont itemWithString: @"Otherworld" block:^(id sender){
        NSLog(@"GO TO SCAN");
        
        [SceneManager pushInventoryLayer];
    }];*/
    
    CCMenuItemFont *m_menu = [CCMenuItemFont itemWithString: @"Menu" block:^(id sender){
        NSLog(@"GO TO MENU");
        
        //[SceneManager goMenuLayer];
    }];
    
    CCMenuItemFont *m_runaway = [CCMenuItemFont itemWithString: @"Run Away" block:^(id sender){
     NSLog(@"RUN AWAY");
        //[self doPause];
        [[CCDirector sharedDirector] pause];
        
        InventoryLayer *inventoryLayer = [InventoryLayer initInventoryLayer];
        
        if ([[[CCDirector sharedDirector] runningScene] isKindOfClass:CombatLayer]){
            [[[CCDirector] runningScene] addInventoryLayer];
        }
        
        [[[CCDirector sharedDirector] runningScene] addChild:inventoryLayer z:100];

     }];
   
    CCMenu *modeMenu = [CCMenu menuWithItems:m_inventory, m_menu, m_runaway, nil];
    
    [modeMenu alignItemsVerticallyWithPadding:20];
    [modeMenu setPosition:ccp(100, 600)];
    
    [self addChild:modeMenu];

}


- (CGRect)groundRect
{
	CGSize s = [ground contentSize];
	return CGRectMake(-s.width / 2, 0, s.width, s.height);
}

-(void) addChildToMid:(CCNode *)aNode
{
    [midLayer addChild:aNode];
}


-(int) getGroundWidth;
{
    return [self groundRect].size.width;
}


// Process touches (old)
/*
 -(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
 {
 PlayerCharacter pc = [model getTouchedPC: touch];
 if (pc != NULL){
 [pc isSelected];
 
 //if dragging-> get PC to store touch
 
 } else {
 //move selected PC towards touch
 [[model selectedPC] moveToTouch:touch];
 
 //or
 //[[model selectedPC] moveTowardsTouch:touch];
 
 
 return YES;
 }
 */
/*
 -(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
 {
 CGPoint groundAnchor = [ground convertToWorldSpace:CGPointZero];
 //NSLog(@"%f, %f", groundAnchor.x, groundAnchor.y);
 
 // Scrolls screen when background dragged
 CGPoint touchLocation = [touch locationInView: [touch view]];
 CGPoint prevLocation = [touch previousLocationInView: [touch view]];
 
 touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
 prevLocation = [[CCDirector sharedDirector] convertToGL: prevLocation];
 
 CGPoint diff = ccpSub(touchLocation,prevLocation);
 
 //NOTE: moving quickly foils this scheme :(
 if ((groundAnchor.x<=0 || diff.x<0) && (groundAnchor.y<=0 || diff.y<0)) {
 
 CCNode *node = [self getChildByTag:kTagNode];
 CGPoint currentPos = [node position];
 [node setPosition: ccpAdd(currentPos, diff)];
 }
 
 }*/


-(void)doPause
{
	ccColor4B c ={0,0,0,150};
	[PauseLayer layerWithColor:c delegate:[[CCDirector sharedDirector] runningScene]];
}





@end
