# <rdar://22463881>

<http://www.openradar.me/22463881>

Summary:

While using Xcode 7 beta 6 7A192o, a seemingly invalid jpg image crashes
actool with this error:

```
'IBPlatformToolFailureException', reason: 'The agent crashed
```

Steps to reproduce:

1. Switch to the Xcode 7 beta 6 command line tools
2. In the example project run the crash.sh script
3. Wait for actool to crash

Expected results:

The xcassets file should be compiled correctly each time.

Actual results:

actool occasionally crashes (nearly 100% on CI)

Notes:

- See the included crash.log for the crash
- If the crash doesn't happen after a reasonable amount of time, it
  typically happens very soon after ibtool is started. Kill ibtoold
  with: `pgrep ibtool | xargs kill -9` and run the script again
- This jpg has been included in our project with no issue for a long
  time
- We still don't see anything wrong with this file, but re-exporting it
  solved the problem
