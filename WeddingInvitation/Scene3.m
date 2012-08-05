//
//  Scene3.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene3.h"
#import "Scene4.h"
#import "SimpleAudioEngine.h"

int sprite_indx;
NSMutableArray *sprite_arr;
@implementation Scene3

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene3 *layer = [Scene3 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) nextanim: (id) sender{
    
    sprite_indx ++;
    NSLog(@"In Next anim : %d",sprite_indx);
    int x=0,y=0;
    int xvel=0,yvel=0;
    CCSprite *sprite;
    switch (sprite_indx) {
     case 1:
             x = 400;
             y = 100;
             xvel = 100;
             yvel = -10;
             sprite = [CCSprite spriteWithFile:@"smilie.png"];
             break;
     case 2:
             x = 100;
             y = 100;
             xvel = 400;
             yvel = -10;
             sprite = [CCSprite spriteWithFile:@"coffee.png"];
             break;
     case 3:
             x = 400;
             y = 100;
             xvel = 100;
             yvel = -10;
             sprite = [CCSprite spriteWithFile:@"smilieread.png"];
             break;
     case 4:
             x = 100;
             y = 100;
             xvel = 400;
             yvel = -10;
             sprite = [CCSprite spriteWithFile:@"heart_broken.png"];
             break;
     case 5:
             x = 400;
             y = 100;
             xvel = 100;
             yvel = -10;
             sprite = [CCSprite spriteWithFile:@"wink1.png"];
             break;
     case 6:
             [self removeChild:_emitter cleanup:YES];
             [_emitter stopSystem];
           [[CCDirector sharedDirector]replaceScene:[CCTransitionShrinkGrow transitionWithDuration:5 scene:[Scene4 node]]];
             return; 
     default:
     break;
     }
     id anim_moveto = [CCMoveTo actionWithDuration:4.0f position:ccp(xvel, yvel)];
     [self addChild:sprite];
     [sprite setPosition:ccp(x,y)];
     CCSequence *seq = [CCSequence actions:anim_moveto,[CCCallFunc actionWithTarget:self selector:@selector(nextanim:)], nil];
     [sprite runAction:seq]; 
    
    
    //[_lovesym runAction:rot_anim]; 
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        CCSprite *lap1 = [CCSprite spriteWithFile:@"laptop.png"];
        [lap1 setPosition:ccp(100,50)];
        [self addChild:lap1];
        
        CCSprite *lap2 = [CCSprite spriteWithFile:@"laptop_1.png"];
        [lap2 setPosition:ccp(400,50)];
        [self addChild:lap2];
        CCSprite *lovesym = [CCSprite spriteWithFile:@"lovesym.png"];
        //[_lovesym setPosition:ccp(220,120)];
        //[self addChild:_lovesym];
        sprite_arr = [NSMutableArray arrayWithCapacity:10];
        [sprite_arr addObject:lovesym]; 
        lovesym = [CCSprite spriteWithFile: @"smilie.png"];
        [sprite_arr addObject:lovesym];
        NSLog(@"%d",[sprite_arr count]);
        id anim_moveto = [CCMoveTo actionWithDuration:3.0f position:ccp(400, 0)];
        sprite_indx = 0;
        CCSequence *seq = [CCSequence actions:[CCDelayTime actionWithDuration:2.0f],anim_moveto,[CCCallFunc actionWithTarget:self selector:@selector(nextanim:)], nil];
        [self addChild:[sprite_arr objectAtIndex:0]];
        [[sprite_arr objectAtIndex:0] setPosition:ccp(220,120)];
        [[sprite_arr objectAtIndex:0] runAction:seq];
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"Scene3_Final.mp3"];
        
        
        
        //_emitter = [[CCParticleSnow alloc]init];
        //_emitter = [CCParticleSnow particleWithFile:@"love_sym.plist"];
        //[self addChild:_emitter];
        //id particlesys = [CCParticleSystemQuad particleWithFile:@"stars_effect.plist"];
        id particlesys1 = [CCParticleSystemQuad particleWithFile:@"love_sym.plist"];
        [particlesys1 autoRemoveOnFinish];
        [self addChild:particlesys1];
        
        
    }
    return self;
}


- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    _emitter = NULL;
    _lovesym = NULL;
	[super dealloc];
}

@end
