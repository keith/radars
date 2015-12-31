# <rdar://24029513>

<http://www.openradar.me/24029513>

Summary:

When "Automatically trim trailing whitespace" and "Including
whitespace-only lines" are enabled in Xcode's "Text Editing"
preferences, blank lines in multiline comments are not trimmed.

Steps to reproduce:

1. Enabled the 2 mentioned settings, from the command line if you'd
   like:
```
defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool true
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
```

2. Add a blankline with trailing whitespace in a multiline comment (open
   the attached file for an example)
3. Save the file

Expected results:

Xcode trims the blank line in the comment

Actual results:

Xcode doesn't touch the lines inside comments, leaving it with trailing
whitespace.
