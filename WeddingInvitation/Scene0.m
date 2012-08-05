//
//  Scene0.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene0.h"
#import "Scene1.h"
#import "SimpleAudioEngine.h"
@implementation Scene0

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene0 *layer = [Scene0 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        CGSize winsize = [[CCDirector sharedDirector]winSize];
        CCLabelTTF *start_label = [CCLabelTTF labelWithString:@"All characters in this story" fontName:@"exmouth_.ttf" fontSize:45.0];
        CCLabelTTF *second_label = [CCLabelTTF labelWithString:@"resembles to only Pavan and Ashwini" fontName:@"exmouth_.ttf" fontSize:35.0];
        start_label.position = ccp(winsize.width/2, winsize.height/2+20);
        second_label.position = ccp(winsize.width/2+10, winsize.height/2-40);
        [self addChild:start_label];
        [self addChild:second_label];
        [self schedule:@selector(ontick:) interval:2.0f];
    }
    return self;
}

-(void) ontick: (ccTime) dt {
    [[CCDirector sharedDirector]replaceScene:[CCTransitionPageTurn transitionWithDuration:0.1f scene:[Scene1 node]]];
}

- (void) dealloc
{
    [super dealloc];
}
@end
