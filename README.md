# FlexBind

An add-on provides amount of very customizable bindings for all actions
in game World of Warcraft.

## Introduction of Version Numbers

FlexBind version includes three numbers:

- The first number increases if World of Warcraft client upgraded, which means
  the value of `## Interface:` in `FlexBind.toc` is changed.

- The second number increases if new features added.

- The last number increases only on issue fixing.

## Slash Commands

### Binding Scheme

**`/flexbind list-schemes`**

Lists all loaded binding schemes.

**`/flexbind enable-scheme SCHEME`**

Enables the binding scheme named with SCHEME.

**`/flexbind disable-scheme SCHEME`**

Disables the binding scheme named with SCHEME.

### Miscellaneous

**`/flexbind help`**

Shows help information, press ESC to hide console again.

**`/flexbind show-console`**

Shows console frame.

## Configurations

FlexBind configurations are placed in file `etc/config.lua`, you can open/edit
this file with any plaintext editors.

**`logLevel`**

The logging level of FlexBind, any log messages with higher level than this
value will be ignored and not logged.

Available levels:

1 - Error: Some error occurred and can't be recovered, process stopped.

2 - Warnning: Some bad thing happened but recovered, process can continue.

3 - Info: Useful information should be noticed.

4 - Debug: Verbose information for developer debugging.

## License

Copyright (C) 2016 Garrett HE

The GNU General Public License (GPL) version 3, see [COPYING](./COPYING).
