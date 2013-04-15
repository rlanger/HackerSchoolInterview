//
//  Character.h
//  Lesson1
//
//  Created by Rebecca Langer on 12-10-30.
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#import "cocos2d.h"
#import "Constants.h"

@class Model;
@class Global;
@class CharStats;

@interface Character : CCSprite
<CCTouchOneByOneDelegate>
{
@private
    CGPoint drawAnchor;
    int screenHeight;



    int baseDamage;
    int variableDamage;
        
@public
    float attackSpeed;
    float timeSinceLastAttack;
    Model *model;
    int cType;
    float hp;
    float hpMax;
    CGPoint velocity;
    int speedMultiplier;
    Character *target;
    CGPoint destination;
    bool ready;
}

@property(nonatomic, readonly) CGRect rect;
@property(nonatomic, readonly) CGRect rectInPixels;

+ (id) characterWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel andType: (ChType)aType;
- (id)initWithTexture:(CCTexture2D *)aTexture andModel: (Model *)aModel andType: (ChType)aType;
- (bool) containsTouchLocation:(UITouch*)touch;
- (void) combatAI;
- (void) calculateVelocity;
- (void) damageTarget;
- (void) drawSelectionBox;
- (void) drawReadyBox;
- (void) drawHealthBar;
- (void) calculateVelocityTo: (CGPoint) pcDest;
- (void)adjustHP:(int)adjustment;
- (void) resetAttack;




@end
