# gdbs : gdb-switcher

Just simple gdb switcher between peda, gef and pwndbg.

- [hugsy/gef: Multi-Architecture GDB Enhanced Features for Exploiters & Reverse-Engineers](https://github.com/hugsy/gef)
- [longld/peda: PEDA - Python Exploit Development Assistance for GDB](https://github.com/longld/peda)
- [pwndbg/pwndbg: Exploit Development and Reverse Engineering with GDB Made Easy](https://github.com/pwndbg/pwndbg)

## Caution !!!

- This script **DOESN'T INSTALL** all requirements of each debugger. You should install them for yourself. (Especially `gef`)
- This script just launch the default `.gdbinit` of each debugger.
- Now this script **DOESN'T include your own configuration** in `.gdbinit`.
    - If your own script was removed, please check the backuped script `~/.gdbinit-backup@YYYYMMDD`


## Usage

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

## Envirnment 

- **bash** : add `gdbs` bash function in `~/.bashrc` 
- Only tested in my own envirnment

## Install

- Clone `gdb-switcher` repo.
```bash
$ git clone https://github.com/2O2L2H/gdb-switcher.git
```

- Run `setup.sh` 
    - Install gef, peda, pwndbg as `git submobule`
    - Configure `~/.gdbinit-{gef,peda,pwndbg}` files
    - Add `gdbs` function in  `~/.bashrc`
```bash
$ ./setup.sh 
```






