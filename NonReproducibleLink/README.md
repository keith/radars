## <rdar://FB9593507>

**NOTE**: You can workaround this specific repro case by passing
`-no_objc_category_merging`

Summary:

With ld it's possible to get non-deterministic behavior where the
objc_const section's contents are in different orders. Attached is a
repro case. Run ./repro.sh to experience it. Sometimes it takes multiple
runs to hit. The gist of the project is that it links an empty libmain.a
with GoogleMaps (using -all_load).

Steps to Reproduce:

Run ./repro.sh

Expected Results:

The binaries should never differ since we're setting ZERO_AR_DATE and
providing the same inputs every time.

Actual Results:

The binaries differ in a very reproducible way.

Environment:

Xcode 13.0 beta 5 and before
