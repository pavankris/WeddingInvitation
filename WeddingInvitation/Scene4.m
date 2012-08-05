//
//  Scene4.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene4.h"
#import "Scene5.h"
#import "SimpleAudioEngine.h"
@implementation Scene4
@synthesize boy_walk_action = _boy_walk_action;
@synthesize boy_img = _boy_img;
@synthesize boy_walk_array = _boy_walk_array;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene4 *layer = [Scene4 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        CCSprite *bg_img = [CCSprite spriteWithFile:@"night_moon.jpg"];
        [bg_img setPosition:ccp(340,180)];
        [self addChild:bg_img];
        
        //CCParticleGalaxy *part = [[CCParticleGalaxy alloc]init];
        //[part resetSystem];
        //part = [CCParticleGalaxy particleWithFile:@"stars_effect.plist"];
        
        
        id particlesys = [CCParticleSystemQuad particleWithFile:@"stars_effect.plist"];
        [self addChild:particlesys];
        //part.position = ccp(280,100);
        snow_effect = [CCParticleSnow particleWithFile:@"snow_effect1.plist"];
        [self addChild:snow_effect];
        //[self addChild:part];
        
        //CCParticleSnow *snow_effect = [[CCParticleSnow alloc]init];
        //[snow_effect resetSystem];
        
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"kurt_sheet1.png"];
        CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithTexture:texture capacity:20];
        [self addChild:sheet];
        NSMutableArray *animFrames = [NSMutableArray array];
        CCSprite *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0,270,35,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(35,270,30,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(65,270,30,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(95,270,30,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(125,270,35,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(160,270,30,50)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(190,270,35,50)];
        [animFrames addObject:frame];
        
        /*CCAnimation *animation = [CCAnimation animationWithFrames:animFrames delay:0.5f];
        id animate = [CCAnimate actionWithAnimation:animation restoreOriginalFrame:NO];
        id actionmove = [CCMoveBy actionWithDuration:0.2f position:ccp(5,0)];
        CCSpawn *spawn = [CCSpawn actionOne:actionmove two:animate];
        id action = [CCRepeat actionWithAction:spawn times:1];
        CCSequence *seq = [CCSequence actions:action,[CCCallFunc actionWithTarget:self selector:@selector(nextsceneanim:)],nil];
        self.boy_walk_action = [CCRepeat actionWithAction:seq times:20];
        [_boy_walk_array addObject:self.boy_walk_action];
        */
        
        CCSpriteFrame *frame1 = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(0,270,35,50)];
        self.boy_img = [CCSprite spriteWithSpriteFrame:frame1];
        _boy_img.position = ccp(200, 20);
        
        [self addChild:_boy_img];
        CCAnimation *walkAnim = [CCAnimation animationWithFrames:animFrames delay:0.3f];
        self.boy_walk_action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
        [_boy_img runAction:_boy_walk_action];
        id moveto = [CCSequence actionOne:[CCMoveTo actionWithDuration:15.0f position:ccp(400,20)] 
                                      two:[CCCallFunc actionWithTarget:self selector:@selector(nextsceneanim:)]];;
        
        [_boy_img runAction:moveto];
        
        id follow_anim = [CCFollow actionWithTarget:self.boy_img worldBoundary:CGRectMake(0, 0, 1050, 420)];
        [self runAction:follow_anim];
        [[SimpleAudioEngine sharedEngine] playEffect:@"Scene4.mp3"];
        
    }
    return self;
}

- (void) nextsceneanim: (id) sender {
    
    //[self.camera setCenterX:200.0f centerY:0.0f centerZ:0.0f];
    NSLog(@"Done anim");
    [[CCDirector sharedDirector]replaceScene:[CCTransitionTurnOffTiles transitionWithDuration:5 scene:[Scene5 node]]];
}


- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"    
	[super dealloc];
}
@end
