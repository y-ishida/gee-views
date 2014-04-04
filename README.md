gee-views
=========

This is gdb macros to print gee containaers contents,
size, type and more.

gee-views is licensed under GPL2.

Copyright(c) Yusuke Ishida.


Install
---------

Add the following definition to .gdbinit.

```
source gee-views.gdb
```

Usage
---------

Use a `pgee` macro to print gee container contents, size and type.

```
(gdb)pgee con
```

The `con` is a gee container variable described in a source code.

Note that the container element type must be fundamental type in the `pgee` macro.
If the container elements are inherited GObject, use a `pgeeo` macro instead.

```
(gdb)pgeeo con
```

Or use 'pggel' and 'pgeeol' macros when you need to view index numbers.

```
(gdb)pgeel con
(gdb)pgeeol con
```

Note that these every macros are use a user heap memory and
operate a reference counter of the container or its elements.


