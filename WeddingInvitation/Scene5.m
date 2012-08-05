//
//  Scene5.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene5.h"
#import "Scene6.h"
#import "SimpleAudioEngine.h"

@implementation Scene5
ALuint effect_id;
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene5 *layer = [Scene5 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        CGSize winsize = [[CCDirector sharedDirector]winSize];
        CCSprite *bg_img = [CCSprite spriteWithFile:@"newyork1.png"];
        [bg_img setPosition:ccp(winsize.width/2, winsize.height/2+50)];
        [self addChild:bg_img];
        
        CCTexture2D *girl_texture = [[CCTextureCache sharedTextureCache] addImage:@"girl_anim_2.png"];
        CCTexture2D *boy_texture = [[CCTextureCache sharedTextureCache] addImage:@"kurt_sheet1.png"];
        CCSpriteBatchNode *girl_sheet = [CCSpriteBatchNode batchNodeWithTexture:girl_texture capacity:10];
        CCSpriteBatchNode *boy_sheet = [CCSpriteBatchNode batchNodeWithTexture:boy_texture capacity:20];
        [self addChild:boy_sheet];
        [self addChild:girl_sheet];
        
        NSMutableArray *boyanimFrames = [NSMutableArray array];
        NSMutableArray *girlanimFrames = [NSMutableArray array];
        CCSprite *frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(0, 330, 30, 65)];
        //[boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(35, 330, 25, 55)];
        //[boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(65, 335, 25, 55)];
        //[boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(95, 335, 30, 55)];
        //[boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(125, 335, 30, 55)];
        [boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(165, 335, 30, 60)];
        [boyanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(195, 335, 25, 40)];
        [boyanimFrames addObject:frame];
        
        
        frame = [CCSpriteFrame frameWithTexture:girl_texture rect:CGRectMake(230, 0,30 , 60)];
        [girlanimFrames addObject:frame];
        
        frame = [CCSpriteFrame frameWithTexture:girl_texture rect:CGRectMake(45,235,45 ,55)];
        [girlanimFrames addObject:frame];
        
        
       
        CCSpriteFrame *frame1 = [CCSpriteFrame frameWithTexture:girl_texture rect:CGRectMake(205,0, 25,60)];
        CCSprite *_girl_img = [CCSprite spriteWithSpriteFrame:frame1];
        _girl_img.position = ccp(250, 100);
        [girl_sheet addChild:_girl_img];
        
        
        CCSpriteFrame *frame2 = [CCSpriteFrame frameWithTexture:boy_texture rect:CGRectMake(125, 335, 30, 55)];
        CCSprite *boy_img = [CCSprite spriteWithSpriteFrame:frame2];
        boy_img.position = ccp(230, 90);
        [boy_sheet addChild:boy_img];
        
        CCAnimation *propose_anim = [CCAnimation animationWithFrames:boyanimFrames delay:2.0f];
      
        CCSequence *boy_seq = [CCSequence actions:[CCDelayTime actionWithDuration:1.0f],
                               [CCAnimate actionWithAnimation:propose_anim restoreOriginalFrame:NO], nil];
        CCAction *boy_action = [CCRepeat actionWithAction:boy_seq times:1];
        
        CCAnimation *girl_anim = [CCAnimation animationWithFrames:girlanimFrames delay:1.0f];
        id girl_animate = [CCAnimate actionWithAnimation:girl_anim restoreOriginalFrame:NO];
        CCDelayTime *delay = [CCDelayTime actionWithDuration:12.0f];
        CCSequence *seq = [CCSequence actions:delay,girl_animate,[CCDelayTime actionWithDuration:8.0f],[CCCallFunc actionWithTarget:self selector:@selector(doneanim:)], nil];
        id scale_action = [CCScaleTo actionWithDuration:10.0 scale:1.5f];
        
        
        [boy_img runAction:boy_action];
        [self runAction:scale_action];
        
        [_girl_img runAction:[CCRepeat actionWithAction:seq times:1]];
        
        [self schedule:@selector(onTick:) interval:11];
        
        
    }
    return self;
}

- (void) onTick: (ccTime) dt {
    effect_id = [[SimpleAudioEngine sharedEngine]playEffect :@"116_short_finding-hope_0015.mp3"];
   
}

- (void) doneanim: (id) sender {
    [[SimpleAudioEngine sharedEngine]stopEffect:effect_id];
    [[SimpleAudioEngine sharedEngine]unloadEffect:@"116_short_finding-hope_0015.mp3"];
    [self unschedule:@selector(onTick:)];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitCols transitionWithDuration:2 scene:[Scene6 node]]];
    
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
