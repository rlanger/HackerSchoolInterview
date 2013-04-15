#import "Global.h"
#import "Constants.h"

@implementation Global

static Global *sharedState = nil;

//CWL_SYNTHESIZE_SINGLETON_FOR_CLASS(Global);


@synthesize inventory;
//@synthesize sceneManager;
@synthesize protagonist;

+ (Global *)sharedState {
    if (sharedState == nil) {
        sharedState = [[super allocWithZone:NULL] init];
    }
    
    return sharedState;
}

-(id)init {
    
    self = [super init];
    
    if (self) {
        self.inventory = [Inventory createInventory];
        
        self->combatOn = true;
        
        self.protagonist = [[CharStats alloc] init];
        
    }
    
    return self;
}

+(id)alloc {
    @synchronized([Global class]) {
        NSAssert(sharedState == nil, @"Attempted to allocate a second instance of a singleton.");
        sharedState = [super alloc];
        return sharedState;
    }
    return nil;
}

// We don't want to allocate a new instance, so return the current one.
+ (id)allocWithZone:(NSZone*)zone {
    return [self sharedState];
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}


-(void)encodeWithCoder:(NSCoder *)coder {

}

-(id)initWithCoder:(NSCoder *)coder {
    CCLOG(@"initWithCoder called");
    self = [super init];
    if(self != nil) {
        CCLOG(@"initWithCoder self exists");

    }
    return self;
}


- (void) addToInventory:(FoodItem *) item {
    [inventory addItem:item];
}


- (float) getProtagonistEnergy {
    return protagonist->energy;
}

- (float) getProtagonistMaxEnergy {
    return protagonist->energyMax;
}



@end