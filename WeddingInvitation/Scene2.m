//
//  Scene2.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene2.h"
#import "SimpleAudioEngine.h"
#import "Scene3.h"

@implementation Scene2
@synthesize girl_walk_action = _girl_walk_action;
@synthesize girl_img = _girl_img;
@synthesize girl_walk_array = _girl_walk_array;
@synthesize boy_img = _boy_img;
@synthesize boy_speak_action = _boy_speak_action;



+(CCScene *) scene
{
    NSLog(@"inside scene");
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene2 *layer = [Scene2 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
    
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
    NSLog(@"init");
	if( (self=[super init])) {        
        univ_bg_img = [CCSprite spriteWithFile:@"azcity.jpg"];
        [univ_bg_img setPosition:ccp(240,160)];
        [self addChild:univ_bg_img];
        az_logo_img = [CCSprite spriteWithFile:@"arizona_logo_1.png"];
        [az_logo_img setPosition:ccp(250,180)];
        [self addChild:az_logo_img];
        
    
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"boy_sprite3.png"];        
        CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithTexture:texture capacity:10];
        
        [self addChild:sheet];
       
        
       
        
        NSMutableArray *boyanim1Frames = [NSMutableArray array];
        //girl
        
        //boy (30,420) - (175,590)
        
        CCSprite *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(30,420,145,170)];
        //[boyanim1Frames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(175,420,165,170)];
        [boyanim1Frames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(350,420,160,170)];
        [boyanim1Frames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(530,420,160,170)];
        [boyanim1Frames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(720,420,160,170)];
        [boyanim1Frames addObject:frame];    
        
        
        
        CCSpriteFrame *boy_frame1 = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(30,420,145,170)];
        self.boy_img = [CCSprite spriteWithSpriteFrame:boy_frame1];
        _boy_img.position = ccp(400,70);
        [sheet addChild:_boy_img];
            
        CCAnimation *animation = [CCAnimation animationWithFrames:boyanim1Frames delay:0.8f];
        id action = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:animation
 restoreOriginalFrame:NO] times:4];
        
        id seq = [CCSequence actionOne:action two:[CCCallFunc actionWithTarget:self selector:@selector(doneanim:)]];
        id action1 = [CCScaleBy actionWithDuration:10.0f scale:1.3f];
        
        [_boy_img runAction:seq];
        [[SimpleAudioEngine sharedEngine] playEffect:@"Scene2_Final.mp3"];
        //[self runAction:action1];
    }
    return self;
}

- (void) doneanim: (id) sender {
    
    //[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionShrinkGrow transitionWithDuration:2 scene:[Scene3 node]]];
}


- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    [[CCTextureCache sharedTextureCache]removeUnusedTextures];
    [self.girl_walk_array removeAllObjects];
    self.girl_img = nil;
    self.boy_img = nil;
    self.girl_walk_action = nil;
    self.boy_speak_action = nil;
	[super dealloc];
}

@end
