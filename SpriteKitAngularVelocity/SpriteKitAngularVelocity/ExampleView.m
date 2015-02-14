#import "ExampleView.h"

@interface ExampleView ()

@property (nonatomic) SKScene *customScene;
@property (nonatomic) SKSpriteNode *spriteNode;

@end

@implementation ExampleView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.customScene = [SKScene sceneWithSize:frame.size];
    self.customScene.backgroundColor = [NSColor purpleColor];

    self.spriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"pulley.pdf"];
    self.spriteNode.physicsBody = [SKPhysicsBody bodyWithTexture:self.spriteNode.texture
                                                            size:self.spriteNode.size];
    self.spriteNode.anchorPoint = CGPointMake(0.5, 0.694);
    self.spriteNode.position = CGPointMake(frame.size.width / 2,
                                           self.spriteNode.anchorPoint.y *
                                           self.spriteNode.size.height);
    self.spriteNode.physicsBody.pinned = YES;
    self.spriteNode.zRotation = M_PI_4 / 4;
    [self.customScene addChild:self.spriteNode];

    return self;
}

- (void)viewWillMoveToSuperview:(NSView *)newSuperview
{
    [super viewWillMoveToSuperview:newSuperview];
    if (!newSuperview) {
        return;
    }

    [self presentScene:self.customScene];
    [self animate];
}

- (void)animate
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(1.5 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
       self.spriteNode.physicsBody.angularVelocity = 0.0 / 0.0;
    });
}

@end
