# gdbs : gdb-switcher

Just simple gdb switcher between peda, gef, pwndbg and radare2

- [hugsy/gef: Multi-Architecture GDB Enhanced Features for Exploiters & Reverse-Engineers](https://github.com/hugsy/gef)
- [longld/peda: PEDA - Python Exploit Development Assistance for GDB](https://github.com/longld/peda)
- [pwndbg/pwndbg: Exploit Development and Reverse Engineering with GDB Made Easy](https://github.com/pwndbg/pwndbg)
- [radare/radare2: unix-like reverse engineering framework and commandline tools](https://github.com/radare/radare2)

## Usage


## Environment

Bash in Ubuntu

## Install

### 1. Clone

Clone `gdb-switcher` repo.

```bash
$ git clone https://github.com/2O2L2H/gdb-switcher.git
```

### 2. (Optional) Install debugger

Install debugger only if those are not installed before.

```bash
$ ./install.sh
```

### 3. Configuration

Configure : just add `gdbs()` function in `~/.bashrc`.
If you have your own configuration, add your config in `~/.gdbinit-my`.

```bash
$ ./setup.sh
```

## Use

```bash
$ gdbs executable

$ gdbs
  config gdb config
```


-------


https://asciinema.org/a/eu8fjcp6x7ikhvmc0k6cbl14x
<a href="https://asciinema.org/a/eu8fjcp6x7ikhvmc0k6cbl14x" target="_blank"><img src="https://asciinema.org/a/eu8fjcp6x7ikhvmc0k6cbl14x.png" /></a>

```bash
$ gdbs
[*] How to use gdbs : gdb-switcher
$ gdbs {gef | peda | pwndbg} debug_file

# gef
$ gdbs gef debug_file

# peda
$ gdbs peda debug_file

# pwndbg
$ gdbs pwndbg debug_file

# Use the previous configuration
$ gdb debug_file
```