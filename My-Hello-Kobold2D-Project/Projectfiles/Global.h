//
//  Global.h
//  KoboldTest
//
//  Created by Rebecca Langer on 13-01-27.
//
//

#import <Foundation/Foundation.h>
#import "Inventory.h"
#import "SceneManager.h"
#import "SynthesizeSingleton.h"
#import "CharStats.h"

@interface Global : NSObject <NSCoding> {
@public
    Inventory *inventory;
    //SceneManager *sceneManager;
    
    bool combatOn;
    CharStats *protagonist;
}

@property Inventory *inventory;
//@property SceneManager *sceneManager;

@property CharStats *protagonist;

//SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(Global);

+ (Global*)sharedState;

- (void) addToInventory:(FoodItem *) item;

- (float) getProtagonistEnergy;

- (float) getProtagonistMaxEnergy;


@end
