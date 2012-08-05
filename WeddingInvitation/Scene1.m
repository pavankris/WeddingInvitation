//
//  Scene1.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene1.h"
#import "SimpleAudioEngine.h"
#import "Scene2.h"
@implementation Scene1
@synthesize girl_turn_action = _girl_turn_action;
@synthesize girl_img = _girl_img;
@synthesize girl_turn_array = _girl_turn_array;
ALuint effect_id;
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene1 *layer = [Scene1 node];
	
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
        [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine]stopEffect:0];
        flight_sprite = [CCSprite spriteWithFile:@"flight_1.png"];
        [flight_sprite setPosition:ccp(450,300)];
        background = [CCSprite spriteWithFile:@"desert.jpg"];
        [background setPosition:ccp(300, 230)];
        [self addChild:background];
        //[self addChild: flight_sprite];
        
        id move_anim = [CCMoveTo actionWithDuration:8 position:ccp(100,100)];
        CCSequence *flight_seq = [CCSequence actions:[CCDelayTime actionWithDuration:1.0f],move_anim, nil];
        id flight_action = [CCRepeat actionWithAction:flight_seq times:1];
        id follow_anim = [CCFollow actionWithTarget:flight_sprite worldBoundary:CGRectMake(0,0, 657, 450)];
        //[flight_sprite runAction:flight_action];
        //[self runAction:follow_anim];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"girl_anim_1.png"];
        CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithTexture:texture capacity:10];
        [self addChild:sheet];
        
        _girl_turn_array = [[NSMutableArray alloc]init];
        NSMutableArray *animFrames = [NSMutableArray array];        
        CCSprite *frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(277,10, 40, 100)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(170, 10, 40,100)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(120, 10, 40,100)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(65, 10, 40,100)];
        [animFrames addObject:frame];
        frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(10, 10, 40,100)];
        [animFrames addObject:frame];
        /*for (int i=0; i<6; i++) {
            frame = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(x_offset, 10, 40,100)];
            x_offset = x_offset - 50;
            [animFrames addObject:frame];
        }*/
        CCAnimation *animation = [CCAnimation animationWithFrames:animFrames delay:0.8f];
        id animate = [CCAnimate actionWithAnimation:animation restoreOriginalFrame:NO];
        id delay = [CCDelayTime actionWithDuration:13.0f];
        CCSequence *seq = [CCSequence actions:delay,animate,[CCDelayTime actionWithDuration:2.0f],[CCCallFunc actionWithTarget:self selector:@selector(doneanim:)],nil];
        self.girl_turn_action = [CCRepeat actionWithAction:seq times:1];
        [_girl_turn_array addObject:self.girl_turn_action];
        
        CCSpriteFrame *frame1 = [CCSpriteFrame frameWithTexture:texture rect:CGRectMake(277, 10,40, 100)];
        self.girl_img = [CCSprite spriteWithSpriteFrame:frame1];
        _girl_img.position = ccp(200, 100);
        [sheet addChild:_girl_img];       
        
        [_girl_img runAction:_girl_turn_action];
        effect_id = [[SimpleAudioEngine sharedEngine] playEffect:@"Ashwani_Final.mp3"];
        id scale_action = [CCScaleTo actionWithDuration:13.0 scale:1.3f];
        [self runAction:scale_action];
    }
    return self;
}

- (void) doneanim: (id) sender {
    /*CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CGPoint centerofscreen = ccp(screenSize.width/2,screenSize.height/2);
    CGPoint diff =  ccpSub(centerofscreen,flight_sprite.position);
    self.position = diff;*/
    NSLog(@"animations done");
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionRotoZoom transitionWithDuration:3 scene:[Scene2 node]]];
}
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    NSLog(@"dealloc scene1");
    [[CCTextureCache sharedTextureCache]removeUnusedTextures];
    [[SimpleAudioEngine sharedEngine]stopEffect:effect_id];
    [self.girl_turn_array removeAllObjects];
    self.girl_img = nil;
    self.girl_turn_action = nil;
    flight_sprite = nil;
    background = nil;
	[super dealloc];
}

@end
