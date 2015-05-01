# <rdar://20785838>

<http://www.openradar.me/20785838>

When editing image names in xcassets files in Xcode, escape brings up
autocomplete instead of completing your edits.

Steps:

1. Open the attached example project
2. Start editing the AppIcon image name
3. Type 'foo' and press escape

Expected:

'foo' is left in the text box and you are no longer editing the name

Actual:

A list of completion options is shown.

Notes:

This is obviously the default text box behavior, but when editing image
names in xcassets it isn't the desired behavior.
