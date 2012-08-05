//
//  HelloWorldLayer.h
//  WeddingInvitation
//
//  Created by pavan krishnamurthy on 8/20/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
//#import "FBConnect.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    //Facebook *fb;
    BOOL logged_in;
    UIViewController *vc;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
//@property (nonatomic, retain) Facebook *fb;
@property (nonatomic,assign) UIViewController *vc;
@end
