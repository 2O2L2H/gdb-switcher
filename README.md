# gdbs : gdb-switcher

Just simple gdb switcher between peda, gef, pwndbg and radare2

- [hugsy/gef: Multi-Architecture GDB Enhanced Features for Exploiters & Reverse-Engineers](https://github.com/hugsy/gef)
- [longld/peda: PEDA - Python Exploit Development Assistance for GDB](https://github.com/longld/peda)
- [pwndbg/pwndbg: Exploit Development and Reverse Engineering with GDB Made Easy](https://github.com/pwndbg/pwndbg)
- [radare/radare2: unix-like reverse engineering framework and commandline tools](https://github.com/radare/radare2)


## Usage

https://asciinema.org/a/2UVFFJrr2wOpYkMKVwlqhF5Fk
<a href="https://asciinema.org/a/2UVFFJrr2wOpYkMKVwlqhF5Fk" target="_blank"><img src="https://asciinema.org/a/2UVFFJrr2wOpYkMKVwlqhF5Fk.png" /></a>

#### 1. Select debugger and launch.
```bash
$ gdbs executable

[*] Which debugger ?

1 : Legacy GDB
2 : peda
3 : gef
4 : pwndbg
5 : radare2

Select {1,2,3,4,5}

[+] gdb-switch => debugger
[+] debugger execution
Reading symbols from ./executable...done.

debugger$
```

#### 2. Just configure debugger and execute gdb later.

```bash
$ gdbs

[*] Which debugger ?

1 : Legacy GDB
2 : peda
3 : gef
4 : pwndbg
5 : radare2
2
[+] gdb-switch => peda

$ ❯ gdb -q ./executable
Reading symbols from ./executable...(no debugging symbols found)...done.
gdb-peda$ 
```


## Environment

Bash in Ubuntu

## Install

#### 1. Clone

Clone `gdb-switcher` repo.

```bash
$ git clone https://github.com/2O2L2H/gdb-switcher.git
```

#### 2. (Optional) Install debugger

Install debugger only if those are not installed before.

```bash
$ ./install.sh
```

#### 3. Configuration

The script adds `gdbs()` function in `~/.bashrc`.
If you have your own configuration, add your config in `~/.gdbinit-my`.

```bash
$ ./setup.sh
```

## Uninstall

Just delete the added `function gdbs()` at the end of `~/.bashrc`.

```bash
# gdbs : gdb-switcher
function gdbs() {
      echo -e "\n[*] Which debugger ?"
...
}
```


