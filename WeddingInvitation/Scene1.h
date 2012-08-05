//
//  Scene1.h
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Scene1 : CCLayer {
    CCSprite *flight_sprite;
    CCSprite *background;
    id _girl_turn_action;
    CCSprite *_girl_img;
    NSMutableArray *_girl_turn_array;
}
@property (nonatomic,retain) id girl_turn_action;
@property (nonatomic,retain) CCSprite *girl_img;
@property (nonatomic,retain) NSMutableArray *girl_turn_array;
+(id)scene;

@end
