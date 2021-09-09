# <rdar://FB9610260>

Summary:

When creating a static archive with 2 object files with different paths but the same names, you see this warning:

```
libtool: warning same member name (a.o) in output file used for input files: bar/a.o and: foo/a.o (due to use of basename, truncation, blank padding or duplicate input files)
```

It turns out in some cases this results in missing debug info when you link the archive and generate a dSYM for it:

```
warning: (arm64)  could not find object file symbol for symbol __Z3foov
warning: (arm64)  could not find object file symbol for symbol __Z4bar2v
```

When you inspect the output with dwarfdump, you can see only 1 source file is in the dwarf:

```
% dwarfdump lib.dwarf | grep decl_file
DW_AT_decl_file ("/tmp/DuplicateBasenameIssue/bar/a.cc")
```

If instead of creating this static library you reference the object files directly in the ld invocation, you end up with correct debug info:

```
ld -o lib -dynamic foo/a.o bar/a.o ...
```

instead of:

```
ld -o lib -dynamic libfoo.a ...
```

```
% dwarfdump lib.dwarf | grep decl_file
                DW_AT_decl_file ("/tmp/DuplicateBasenameIssue/foo/a.cc")
                DW_AT_decl_file ("/tmp/DuplicateBasenameIssue/foo/a.cc")
                DW_AT_decl_file ("/tmp/DuplicateBasenameIssue/bar/a.cc")
```

Steps to Reproduce:

Using the attached sample project run ./repro.sh

Expected Results:

No warnings, and the dwarf should contain references to both source files foo/a.cc and bar/a.cc

Actual Results:

Some file references were missing.

Environment:

Xcode 13.0 beta 5 (and earlier)
