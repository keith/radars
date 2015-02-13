# <rdar://19832212>

<http://www.openradar.me/radar?id=5895632149544960>

Summary:

When setting the start position of an NSWindow in a storyboard, the
actual position after launching the application is calculated before
calculating the actually window's size based on its NSViewController and
its content.

Steps to Reproduce:

1. Create a NSWindowController in a storyboard
2. Select the NSWindow and set its initial position to centered both
   horizontally and vertically
3. Make the windows NSViewController thin
4. Add a view to the NSViewController that constraints the width
5. Launch the application

Expected Results:

The thin window should be perfectly centered in the screen.

Actual Results:

The thin window is slightly off center horizontally, because the windows
origin was calculated before calculating its width.

Notes:

You can fix this by putting the actual size of the window into the
storyboard. Although this size may not always be known at this time.
