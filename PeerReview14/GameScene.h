//
//  GameScene.h
//  PeerReview14
//
//  Created by Ananta Shahane on 07/02/18.
//  Copyright © 2018 Ananta Shahane. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene <SKPhysicsContactDelegate>
@property (assign, nonatomic) CGPoint initialTouch;
@property (assign, nonatomic) CGPoint finalTouch;
@property (assign, nonatomic) SKSpriteNode *CurrentSprite;
@property (assign, nonatomic) int Beyblade;
@property (assign, nonatomic) NSMutableArray *Lights;
@end
