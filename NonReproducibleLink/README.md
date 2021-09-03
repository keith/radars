## <rdar://FB9593507>

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
