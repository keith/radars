## <rdar://19835004>

<http://www.openradar.me/19835004>

Summary:

When using SpriteKit, setting a SKSpriteNode's SKPhysicsBody's
angularVelocity to 0.0 / 0.0 or NaN makes the view disappear.

Steps to Reproduce:

1. Create a SKSpriteNode
2. Add it to a scene
3. Present it
4. Set the node's physicsBody's angularVelocity to 0.0 / 0.0 or
   HUGE_VALF

Expected Results:

Nothing should happen or an exception should be raised

Actual Results:

The view disappears

Notes:

See the attached project for an example
