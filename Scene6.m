//
//  Scene6.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 10/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scene6.h"
#import "SimpleAudioEngine.h"
#import "Invitation.h"

@implementation Scene6

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Scene6 *layer = [Scene6 node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine] playEffect:@"End Credits.mp3"];
        role_label = [CCLabelTTF labelWithString:@"The Beginning.." fontName:@"exmouth_.ttf" fontSize:52.0];
        name_label = [CCLabelTTF labelWithString:@"Till End" fontName:@"Shardee.ttf" fontSize:48.0];
        //role_label.color = ccc3(100, 20, 0);
        CGSize winsize = [[CCDirector sharedDirector]winSize];
        role_label.position = ccp(winsize.width/2 , winsize.height/2 + 20);
        name_label.position = ccp(winsize.width/2+40, winsize.height/2 - 70);
        [self addChild:role_label];
        [self addChild:name_label];
        [self schedule:@selector(ontick:) interval:1.0f];
        i = 0;
    }
    return self;
}

-(void) ontick: (ccTime) dt {
    i++;
    CGSize winsize = [[CCDirector sharedDirector]winSize];
    CCMoveTo *role_move_pos = [CCMoveTo actionWithDuration:1.0f position:ccp(-200,winsize.height/2 + 20)];
    CCMoveTo *name_move_pos = [CCMoveTo actionWithDuration:1.0f position:ccp(650, winsize.height/2 -50)];
    

    switch (i) {
        case 8:           
        {
            [role_label runAction:role_move_pos];
            [name_label runAction:name_move_pos];
            break;
        }
        case 10:
        {
            [role_label setString:@"Thanks to all our "];
            [name_label setString:@"Family & Friends"];
            role_label.position = ccp(winsize.width/2 , winsize.height/2 + 20);
            name_label.position = ccp(winsize.width/2, winsize.height/2 - 50);
            
            break;
        }
        case 13:
        {
            [role_label runAction:role_move_pos];
            [name_label runAction:name_move_pos];
            break;
        }
        case 15:
        {
            [role_label setString:@"Voice"];
            [name_label setString:@"Pavan & Ashwini"];
            role_label.position = ccp(winsize.width/2 , winsize.height/2 + 20);
            name_label.position = ccp(winsize.width/2, winsize.height/2 - 50);
            break;
        }
        case 18:
        {
            [role_label runAction:role_move_pos];
            [name_label runAction:name_move_pos];
            break;
        }
        case 20:
        {
            [role_label setString:@"Music"];
            [name_label setString:@"Praveen Koval"];
            role_label.position = ccp(winsize.width/2 , winsize.height/2 + 20);
            name_label.position = ccp(winsize.width/2, winsize.height/2 - 50);
            break;
        }
        case 25:
        {
            [role_label runAction:role_move_pos];
            [name_label runAction:name_move_pos];
            break;
        }
        case 27:
        {
            [role_label setString:@"Direction"];
            [name_label setString:@"Pavan"];
            role_label.position = ccp(winsize.width/2 , winsize.height/2 + 20);
            name_label.position = ccp(winsize.width/2, winsize.height/2 - 50);
            break;
        }
        case 31:
        {
            [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:5 scene:[Invitation node]]];
        }
        default:
            break;
    }
    
}

@end
