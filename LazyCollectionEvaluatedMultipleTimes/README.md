# <rdar://23697280>

<http://www.openradar.me/23697280>

Summary:

Sometimes when accessing elements from a lazy collection, the element is
evaluated multiples times, resulting in unexpected function calls.

Steps to reproduce:

1. Run the attached example with
  `swift LazyCollectionEvaluatedMultipleTimes.swift`

Expected results:

The output is:

```
Called with 'a' returning ''
Called with 'b' returning 'hi'
```

Where each of these entries is evaluated only a single time.

Actual results:

The output is:

```
Called with 'a' returning ''
Called with 'b' returning 'hi'
Called with 'b' returning 'hi'
```

Where `Called with 'b' returning 'hi'` is because the element is
evaluated twice.

Notes:

- This seems to be a side effect of accessing `self[index]` in the given
  example.
- This behavior might be intended, although the expensive function we
  were attempting to call lazily being called multiples times seemed
  unexpected.
