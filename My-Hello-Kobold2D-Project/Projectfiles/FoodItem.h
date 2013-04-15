//
//  FoodItem.h
//  TestProject
//
//  Created by Rebecca Langer on 13-01-02.
//
//

#import "CCNode.h"
#import "Constants.h"

@class Global;

@interface FoodItem : CCNode
{
    NSString *name;
    NSArray *ingredients; //make this a proper struct later
    int ID;
    int healthEffect;
    int energyEffect;
}
 
+ (id) foodItemWithName:(NSString *)aName;
- (id) initWithName:(NSString *)aName;
+ (id) foodItemWithName:(NSString *)aName andType:(FoodType)aType;
- (id) initWithName:(NSString *)aName andType:(FoodType)aType;
- (NSString *)getName;
- (int) getID;
- (void) setID: (int)newID;
- (int)energyEffect;
- (int)healthEffect;
- (bool) allergicEffect;
- (bool) intoleranceEffect;

@end
