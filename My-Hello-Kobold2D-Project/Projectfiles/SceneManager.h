//
//  SceneManager.h
//  KoboldTest
//
//  Created by Rebecca Langer on 13-01-31.
//
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"
#import "InventoryLayer.h"
#import "CombatLayer.h"

@interface SceneManager : NSObject

+ (void) popLayer;
+ (void) goCombatLayer;
+ (void) pushInventoryLayer;
+ (void) goInventoryLayer;
+ (void) goString: (NSString *)layerName;

@end
