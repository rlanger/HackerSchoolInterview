#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PauseLayerProtocol: CCNode

-(void)pauseLayerDidPause;
-(void)pauseLayerDidUnpause;
@end

@interface PauseLayer : CCLayerColor {
    
	PauseLayerProtocol * delegate;
}

@property (nonatomic)PauseLayerProtocol * delegate;

+ (id) layerWithColor:(ccColor4B)color delegate:(PauseLayerProtocol *) del;
- (id) initPauseWithColor:(ccColor4B)c delegate:(PauseLayerProtocol *) del;
-(void)pauseDelegate;

@end