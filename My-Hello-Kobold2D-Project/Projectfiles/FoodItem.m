//
//  FoodItem.m
//  TestProject
//
//  Created by Rebecca Langer on 13-01-02.
//
//

#import "FoodItem.h"
#import "Global.h"
#import "CharStats.h"

@implementation FoodItem

// Each food item has a type (e.g. barcode)
// Types are defined in a constants file of some kind

+ (id)foodItemWithName:(NSString *)aName
{
	return [[self alloc] initWithName:aName];
}

- (id)initWithName:(NSString *)aName
{
	if ((self = [super init]) ) {
        
        name = aName;
        ingredients = [NSArray arrayWithObjects:aName, nil];
        ID = 0; //not yet assigned to inventory
	}
    
	return self;
}

+ (id) foodItemWithName:(NSString *)aName andType:(FoodType)aType
{
    return [[self alloc] initWithName:aName andType:aType];
}

- (id) initWithName:(NSString *)aName andType:(FoodType)aType
{
 
    name = aName;
    ID = 0;
    int fType = aType;
    
    switch (fType) {
        case APPLE:
            ingredients = [NSArray arrayWithObjects:@"apple", nil];
            healthEffect = 10;
            energyEffect = 15;
            break;
            
        case CORN_SYRUP:
            ingredients = [NSArray arrayWithObjects:@"corn syrup", nil];
            healthEffect = -5;
            energyEffect = 15;
            
            NSLog(@"Created Corn Syrup! fType = %d", fType);

            break;
            
            
        case PIZZA:
            ingredients = [NSArray arrayWithObjects:@"crust", @"tomato sauce", @"cheese", nil];
            healthEffect = 5;
            energyEffect = 20;
            break;
            
        case TOFU:
            healthEffect = 10;
            energyEffect = 15;
            ingredients = [NSArray arrayWithObjects:@"tofu", nil];
            break;
            
        default:
            healthEffect = 3;
            energyEffect = 3;
            ingredients = [NSArray arrayWithObjects: aName, nil];
            break;
    }
    
    return self;
    
}

- (NSString *)getName
{
    return name;
}

- (int)getID
{
    return ID;
}

- (int)energyEffect
{
    //NSLog(@"energyEffect = %d", energyEffect);
    return energyEffect;
}

- (int)healthEffect
{
    //NSLog(@"healthEffect = %d", healthEffect);
    return healthEffect;
}


- (bool) allergicEffect
{
    Global *sharedState = [Global sharedState];
    CharStats *protag = [sharedState protagonist];
    
    for (NSString *item in ingredients) {
        for (NSString *allergy in protag->allergens){
            //NSLog(@"%@, %@", item, allergy);

            if ([allergy isEqualToString: item]){
                NSLog(@"ALLERGY OH NO");
                return TRUE;
            }
        }
    }
    
    return FALSE;
}

- (bool)intoleranceEffect
{
    
    NSLog(@"Checking intolerances...");
    
    Global *sharedState = [Global sharedState];
    CharStats *protag = [sharedState protagonist];    
    
    for (NSString *item in ingredients) {
        NSLog(@"%@", item);
        for (NSString *intolerance in protag->intolerances){
            NSLog(@"%@, %@", item, intolerance);
            if ([intolerance caseInsensitiveCompare: item] == NSOrderedSame){
                NSLog(@"INTOLERANCE OH NO");
                return TRUE;
            }
        }
    }
    
    return FALSE;
}

-(void) setID: (int)newID
{
    ID = newID;
}

@end
