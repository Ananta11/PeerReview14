//
//  GameScene.m
//  PeerReview14
//
//  Created by Ananta Shahane on 07/02/18.
//  Copyright © 2018 Ananta Shahane. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.name = @"Fence";
    self.physicsWorld.contactDelegate = self;
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    SKFieldNode *vortex = [SKFieldNode vortexField];
    vortex.position = CGPointMake(0, 0);
    vortex.zPosition = 1;
    vortex.strength = 5.0;
    [self addChild:vortex];
    self.Beyblade = 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    int i = 0;
    self.Beyblade = (self.Beyblade + 1) % 7;
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%d.png",self.Beyblade]];
    sprite.name = @"BayBlade";
    self.CurrentSprite = sprite;
    self.CurrentSprite.zPosition = 1;
    self.CurrentSprite.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.CurrentSprite.size.width/2];
    self.CurrentSprite.physicsBody.dynamic = YES;
    self.CurrentSprite.physicsBody.allowsRotation = YES;
    self.CurrentSprite.physicsBody.angularVelocity = 250;
    self.CurrentSprite.physicsBody.friction = 0;
    self.CurrentSprite.physicsBody.restitution = 1.0;
    self.CurrentSprite.physicsBody.angularDamping = 0.0;
    self.CurrentSprite.physicsBody.linearDamping = 0;
    self.CurrentSprite.lightingBitMask = 0x1;
    self.CurrentSprite.physicsBody.mass = 4;
    for (UITouch *t in touches)
    {
        if(i == 0)
        {
            self.initialTouch = [t locationInNode:self];
        }
        self.CurrentSprite.position = [t locationInNode:self];
    }
    [self addChild:self.CurrentSprite];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches)
    {
        self.CurrentSprite.position = [t locationInNode:self];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSEnumerator *index = [touches objectEnumerator];
    NSArray * a = [index allObjects];
    UITouch * final = (UITouch *)[a lastObject];
    self.finalTouch = [final locationInNode:self];
    self.CurrentSprite.physicsBody.velocity = CGVectorMake(self.finalTouch.x - self.initialTouch.x, self.finalTouch.y - self.initialTouch.y);
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void) didBeginContact:(SKPhysicsContact *)contact
{

}

-(void) didEndContact:(SKPhysicsContact *)contact
{
    
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
