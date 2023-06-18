# Noir mode
[![MELPA](https://melpa.org/packages/noir-mode-badge.svg)](https://melpa.org/#/noir-mode)
[![MELPA Stable](https://stable.melpa.org/packages/noir-mode-badge.svg)](https://stable.melpa.org/#/noir-mode)

`noir-mode.el` is a major mode for editing Noir language source files in Emacs. It provides syntax highlighting for working with Noir code.

## Features

- Syntax highlighting for keywords, types, constants, events, and functions in Noir.
- Automatic file association with `.nr` files.

## Installation

### Melpa

``` shell
package-install noir-mode
```


### Other
1. Make sure you have Emacs version 25.1 and rust-mode 1.05 or higher installed.
2. Download `noir-mode.el` from the [GitHub repository](https://github.com/hhamud/noir-mode).
3. Move `noir-mode.el` to a directory in your Emacs load path.
4. Add the following code to your Emacs configuration file:

```elisp
(require 'noir-mode)
```

## Usage

Once `noir-mode.el` is installed, it will automatically be enabled when you open a `.nr` file. The major mode will provide syntax highlighting for editing Noir code.

## Keybindings

- `M-;` or `Alt-;`: Comment or uncomment a region of code.


## Contributing

Contributions to `noir-mode.el` are welcome. If you find any issues or have suggestions for improvement, please create a new issue or submit a pull request on the [GitHub repository](https://github.com/hhamud/noir-mode).

