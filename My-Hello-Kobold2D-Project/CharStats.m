//
//  CharStats.m
//  My-Hello-Kobold2D-Project
//
//  Created by Rebecca Langer on 2013-04-09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CharStats.h"


@implementation CharStats

@synthesize allergens, possibleAllergens;
@synthesize intolerances, possibleIntolerances;


-(id)init {
    
    self = [super init];
    
    if (self) {
        
        self.allergens = [NSArray arrayWithObjects:@"soy", @"edamame", @"miso", @"natto", @"shoyu", @"soybean", @"tamari", @"tempeh", @"textured vegetable protein", @"hydrolyzed vegetable protein", @"tofu", nil];
        
        self.possibleAllergens = [NSArray arrayWithObjects:@"flavoring",
                                  @"broth", @"bouillon", nil];
        
        self.intolerances = [NSArray arrayWithObjects:@"milk", @"cheese", nil];
        self.possibleIntolerances = [NSArray arrayWithObjects: nil];
        
        energyMax = 30;
        energy = energyMax;

        hpMax = 50;
        hp = hpMax;
        
        allergicReaction = FALSE;
        intoleranceReaction = FALSE;
        
        
    }
    
    return self;
    
}

- (void) adjustEnergy:(int)adjustment{
    int enNew = energy + adjustment;
    if (enNew>energyMax) {
        enNew = energyMax;
    }
    if (enNew<0) {
        enNew = 0;
    }
    
    NSLog(@"Energy: %f -> %d", energy, enNew);
    
    energy = enNew;
}

- (void) adjustHealth:(int)adjustment{
    int hpNew = hp + adjustment;
    if (hpNew>hpMax) {
        hpNew = hpMax;
    }
    if (hpNew<0) {
        hpNew = 0;
    }
    
    NSLog(@"Health: %f -> %d", hp, hpNew);
    
    hp = hpNew;
}

@end
