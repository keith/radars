# <rdar://23695200>

<http://www.openradar.me/23695200>

Summary:

When using Swift's nil coalescing operator, compile time seems to be
exponential based on the number of uses in a statement.

Steps to reproduce:

1. Attempt to compile the attached example

OR

1. Create a swift file with a single function that returns an optional
2. Chain ~10 calls to the function separated by `??`

Expected results:

The file is compiled in a reasonable amount of time

Actual results:

The compile takes an insane amount of time (on my 2014 rMPB the process
was killed after 59 minutes with 9 calls to the function). Seemingly
this compile time is exponential.
