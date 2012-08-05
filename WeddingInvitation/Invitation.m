//
//  Invitation.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Invitation.h"
#import <EventKit/EventKit.h>
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
@implementation Invitation


+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	Invitation *layer = [Invitation node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if( (self=[super init])) {
        CCSprite *bg_img = [CCSprite spriteWithFile:@"wedding_procession.png"];
        CGSize winsize = [[CCDirector sharedDirector]winSize];
        [bg_img setPosition:ccp(winsize.width/2,winsize.height/2)];       
        
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Muhurtam" fontName:@"Marker Felt" fontSize:20];
        CCLabelTTF *loc_label = [CCLabelTTF labelWithString:@"Location" fontName:@"Marker Felt" fontSize:20];
        CCLabelTTF *addr_label = [CCLabelTTF labelWithString:@"Nandana Gardens HanamKonda Warangal, AP" dimensions:CGSizeMake(150,150) alignment:UITextAlignmentCenter fontName:@"carolingia.ttf" fontSize:15];
        CCLabelTTF *invite_label = [CCLabelTTF labelWithString:@"We Love to Have you with us in this Holy Ceremony"fontName:@"HenryMorganHand.ttf" fontSize:30];
        label.position = ccp(60, 300);
        label.color = ccc3(120, 50, 0);
        loc_label.position = ccp(300, 300);
        loc_label.color =ccc3(120, 50, 0);
        addr_label.position = ccp(300, 200);
        addr_label.color = ccc3(0 , 0, 0);
        invite_label.position = ccp(220, 40);
        invite_label.color = ccc3(0, 0, 0);
        [self addChild:bg_img];
        [self addChild:label];
        [self addChild:loc_label];
        [self addChild:addr_label];
        [self addChild:invite_label];
        
        CCMenuItem *menuitem = [CCMenuItemImage itemFromNormalImage:@"muhurtam.png" selectedImage:nil target:self selector:@selector(addtocal:)];
        //menuitem.position = ccp(60, 250);
        CCMenu *menu = [CCMenu menuWithItems:menuitem, nil];
        [menu alignItemsHorizontally];
        menu.position = ccp(70, 230);
        [self addChild:menu];
        
        CCMenuItem *mainmenuitem = [CCMenuItemImage itemFromNormalImage:@"home.png" selectedImage:nil target:self selector:@selector(mainmenu:)];
        CCMenu *mainmenu = [CCMenu menuWithItems:mainmenuitem, nil];
        mainmenu.position = ccp(450, 270);
        [self addChild:mainmenu];
        
        if(![[SimpleAudioEngine sharedEngine]isBackgroundMusicPlaying])
        {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"Tabla and Santoor 2.mp3"];
        }
        
    //requestWithGraphPath:@"me/events" andDelegate:self];
    }
    return self;
}

-(void) addtocal:(id) sender {
   EKEventStore *eventstore = [[EKEventStore alloc]init]; 
    EKEvent *event = [EKEvent eventWithEventStore:eventstore];
    
    //NSDate *startdate = [[NSDate alloc]init];
    //NSDate *enddate = [[NSDate alloc]init];
    
    event.title = @"Pavan-Ashwini Wedding";
    
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *startdate = [dateFormatter dateFromString:@"2011-12-04"];
    
    event.startDate = startdate;
    event.endDate = startdate;
    event.allDay = YES;
    
    [event setCalendar:[eventstore defaultCalendarForNewEvents]];
    
    NSError *err;
    
    [eventstore saveEvent:event span:EKSpanThisEvent error:&err];
    
    if (err == noErr) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Event added" message:@"Event added to calendar" delegate:nil cancelButtonTitle:@"okay" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    //[startdate release];
    //[enddate release];
    [eventstore release];
}

-(void) mainmenu:(id) sender {
   [[CCDirector sharedDirector]replaceScene:[CCTransitionSlideInL transitionWithDuration:2 scene:[HelloWorldLayer node]]];
}
-(void)dealloc {
    [_label release];
    _label = nil;
    [super dealloc];
}
@end
