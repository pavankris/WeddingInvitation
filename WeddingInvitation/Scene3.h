//
//  Scene3.h
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene3 : CCLayer {
    
    CCSprite *_lovesym;
    CCSprite *_fbsym;
    CCParticleSnow*_emitter; 
}

+(id)scene;
@end
