//
//  Scene4.h
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene4 : CCLayer {
    CCSprite *_boy_img;
    NSMutableArray *_boy_walk_array;
    id _boy_walk_action;
    CCParticleSnow *snow_effect;
    CCParticleGalaxy *part;
}

@property (nonatomic,retain) id boy_walk_action;
@property (nonatomic,retain) CCSprite *boy_img;
@property (nonatomic,retain) NSMutableArray *boy_walk_array;
+(id)scene;

@end
