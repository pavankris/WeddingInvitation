//
//  HelloWorldLayer.m
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/20/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "Scene1.h"
#import "SimpleAudioEngine.h"
#import "Scene2.h"
#import "Scene3.h"
#import "Scene4.h"
#import "Scene5.h"
#import "Scene6.h"
#import "Invitation.h"
#import "SHKItem.h"
#import "SHKTwitter.h"
#import "SHKFacebook.h"
#import "Scene0.h"
// HelloWorldLayer implementation
@implementation HelloWorldLayer
//@synthesize fb;
@synthesize vc;
static NSString *appid = @"223985120997521";
//static NSString *secret_key = @"08996c539d4a3575dca013c8efe7c05b";
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
        self.vc =[[UIViewController alloc] init];
        [[SHK currentHelper] setRootViewController:vc];
        CCSprite *bg_img = [CCSprite spriteWithFile:@"weddingcard.jpg"];
		CCLabelTTF *plabel = [CCLabelTTF labelWithString:@"Pavan" fontName:@"Respective_Slanted.ttf" fontSize:38];
        CCLabelTTF *alabel = [CCLabelTTF labelWithString:@"Ashwini" fontName:@"Respective_Slanted.ttf" fontSize:38];
        CCLabelTTF *wlabel = [CCLabelTTF labelWithString:@"Weds" fontName:@"Respective_Slanted.ttf" fontSize:32];
        
        			
		// position the label on the center of the screen
        CGSize winsize = [[CCDirector sharedDirector]winSize];
        bg_img.position = ccp(winsize.width/2, winsize.height/2);
		plabel.position =  ccp(300, 280);       
        plabel.color = ccc3(100,0,0);
        wlabel.position = ccp(225,275);
        wlabel.color = ccc3(0,0,0);
        alabel.position = ccp(140,280);
        alabel.color = ccc3(100,0,0);
        //alabel.rotation = 340;
		
      
		// add the label as a child to this Layer
       
        [self addChild:bg_img];
		[self addChild: plabel];
        [self addChild:alabel];
        [self addChild:wlabel];
        //[self addChild:story_label];
        //MenuItem menu = [MenuItemInfo itemFromString:@"Watch Our Story.." target:self selector:@selector(OnStoryClick)];
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        [CCMenuItemFont setFontSize:20];
       //CCMenuItemLabel *menuitemlabel = [[CCMenuItemLabel itemWithLabel:story_label target:self selector:@selector(onStoryClick:) ]retain];
        
        CCMenuItemImage *item1 = [CCMenuItemImage itemFromNormalImage:@"invite.png" selectedImage:nil disabledImage:nil target:self selector:@selector(onInvitationClick:)];
        CCMenuItemFont *item2 = [CCMenuItemFont itemFromString:@"View Invitation"
            target:self selector:@selector(onInvitationClick:)];
        item2.color = ccc3(0, 0,0);       
        CCMenuItemFont *item3 = [CCMenuItemFont itemFromString:@"Watch our story..." target:self selector:@selector(onStoryClick:)];
        item3.color = ccc3(0, 0,0);
        CCMenuItemImage *item4 = [CCMenuItemImage itemFromNormalImage:@"play_movie.png" selectedImage:nil disabledImage:nil target:self selector:@selector(onStoryClick:)];
        CCMenuItem *fbitem = [CCMenuItemImage itemFromNormalImage:@"fb1.png" selectedImage:nil target:self selector:@selector(fbClick:)];
        CCMenu *fbmenu = [CCMenu menuWithItems:fbitem, nil];
        [fbmenu alignItemsHorizontally];
        fbmenu.position = ccp(240, 12);
        
        CCMenu *mmenu = [CCMenu menuWithItems:item3, nil];
        CCMenu *mmenu1 = [CCMenu menuWithItems:item4, nil];
        CCMenu *imenu = [CCMenu menuWithItems:item1, nil];  
        CCMenu *imenu1 = [CCMenu menuWithItems:item2, nil];
        imenu.position = ccp(40, 35);
        imenu1.position = ccp(140,20);
        
        mmenu.position = ccp(350, 20);        
        mmenu1.position = ccp(450, 35);
        
        
        [self addChild:mmenu];
        [self addChild:imenu1];
        [self addChild:mmenu1];
        [self addChild:imenu];
        [self addChild:fbmenu];
        if(![[SimpleAudioEngine sharedEngine]isBackgroundMusicPlaying])
        {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"Tabla and Santoor 2.mp3"];
        }
        logged_in = NO;
	}
	return self;
}

- (void) onStoryClick: (id)sender {
    // story click listener
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeUp transitionWithDuration:1 scene:[Scene0 node]]];
}

- (void) onInvitationClick: (id)sender {
    [[CCDirector sharedDirector]replaceScene:[CCTransitionSplitRows transitionWithDuration:2 scene:[Invitation node]]];
}

- (void) fbClick: (id)sender {
    UIImage *image = [[CCDirector sharedDirector] screenshotUIImage];
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/us/app/shubaleka/id475932759?ls=1&mt=8"];
    SHKItem *fbItem = [SHKItem image:image title:@"Pavan Ash Wedding Invitation. Checkout Iphone App - Shubaleka"];
    [fbItem setURL:url];
    [SHKFacebook shareItem:fbItem];

    /*if(logged_in == NO)
    {
        NSLog(@"logging in");
        fb = [[Facebook alloc] initWithAppId:appid andDelegate:self];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"FBAccessTokenKey"] 
            && [defaults objectForKey:@"FBExpirationDateKey"]) {
            fb.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
            fb.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
        }
        
        if (![fb isSessionValid]) {
            NSArray *permissions = [[NSArray alloc] initWithObjects:
                                    @"user_likes", 
                                    @"read_stream",
                                    nil];
            [fb authorize:permissions];
            [permissions release];
        }
        /*if (![fb isSessionValid]) {
            [fb authorize:nil];
        }*/
        
        /*NSArray *permissions = [NSArray arrayWithObjects:@"read_stream",@"publish_stream", nil];
        [fb authorize:permissions];*/
        //logged_in = YES;
    /*}
    else
    {
        NSLog(@"posting");
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
        
        [params setObject:@"Pavan Ash Wedding" forKey:@"name"];
        [params setObject:@"Invited" forKey:@"description"];
        [fb requestWithGraphPath:@"me/feed" andParams:params andHttpMethod:@"POST" andDelegate:self];
    }
    
    /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        fb.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        fb.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];            
    }
    if (![fb isSessionValid]) {
        [fb authorize:nil];
    }*/
}


/*- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[fb accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[fb expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    NSLog(@"did login");
    logged_in = YES;
   /* NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   appid, @"app_id",
                                   @"", @"",
                                   @"", @"",
                                   @"", @"",
                                   @"", @"",
                                   @"", @"Pavan Ashwini Wedding",
                                   @"Facebook Dialogs are so easy!",  @"I hoped you liked our invitation. Looking forward to seeing you",
                                   nil];
    
    [fb dialog:@"feed" andParams:params andDelegate:self];
    
}

- (void) fbDidLogout {
    // Remove saved authorization information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }
}

- (void)request:(FBRequest *)request didLoad:(id)result {
    NSLog(@"request did load");
}

- (void)request:(FBRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"received error %@ ", [error userInfo]);
}
*/
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
    //[fb logout:self];
    //[fb release];
    //fb = nil;
	[super dealloc];
}
@end
