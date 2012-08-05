//
//  Scene2.h
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
@interface Scene2 : CCLayer {
    CCSprite *univ_bg_img;
    CCSprite *az_logo_img;
    id _girl_walk_action;
    CCSprite *_girl_img;
    NSMutableArray *_girl_walk_array;
    CCSprite *_boy_img;
    id _boy_speak_action;
    
    
}
@property (nonatomic,retain) id girl_walk_action;
@property (nonatomic,retain) CCSprite *girl_img;
@property (nonatomic,retain) NSMutableArray *girl_walk_array;
@property (nonatomic,retain) CCSprite *boy_img;
@property (nonatomic,retain) id boy_speak_action;


+(id)scene;
@end
