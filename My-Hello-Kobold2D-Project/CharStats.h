//
//  CharStats.h
//  My-Hello-Kobold2D-Project
//
//  Created by Rebecca Langer on 2013-04-09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CharStats : CCNode {
    @public
    NSArray *allergens, *possibleAllergens;
    NSArray *intolerances, *possibleIntolerances;
    
    float energy;
    float energyMax;
    
    float hp;
    float hpMax;
    
    bool allergicReaction;
    bool intoleranceReaction;
    
}

@property NSArray *allergens, *possibleAllergens;
@property NSArray *intolerances, *possibleIntolerances;

- (void) adjustEnergy:(int)adjustment;
- (void) adjustHealth:(int)adjustment;


@end
