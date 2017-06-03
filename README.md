# gdbs : gdb-switcher

Just simple gdb switcher between peda, gef and pwndbg.

- [hugsy/gef: Multi-Architecture GDB Enhanced Features for Exploiters & Reverse-Engineers](https://github.com/hugsy/gef)
- [longld/peda: PEDA - Python Exploit Development Assistance for GDB](https://github.com/longld/peda)
- [pwndbg/pwndbg: Exploit Development and Reverse Engineering with GDB Made Easy](https://github.com/pwndbg/pwndbg)

## Caution !!!

- Now this script **DOESN'T include your own configuration** in `.gdbinit`.
    - If your own script was removed, please check the backuped script `~/.gdbinit-backup@YYYYMMDD`
- This script just launch the default `.gdbinit` of each debugger.


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
```bash
function gdbs() {
    if [ "$#" -lt 2 ]; then
        echo "[*] How to use gdbs : gdb-switcher"
        echo "$ gdbs {gef | peda | pwndbg} debug_file"
        return 1
    fi
    case $1 in
        gef) 
            echo "[*] gdb-switch : gef"
            cp ~/.gdbinit-gef ~/.gdbinit
            gdb $2
        ;;
        peda) 
            echo "[*] gdb-switch : peda"
            cp ~/.gdbinit-peda ~/.gdbinit
            gdb $2
        ;;
        pwndbg) 
            echo "[*] gdb-switch : pwndbg"
            cp ~/.gdbinit-pwndbg ~/.gdbinit
            gdb $2
        ;;
    esac
}
```
- Only tested in my own envirnment

## Install

- Run `setup.sh` : Install gef, peda, pwndbg as `git submobule`

```bash
$ git clone https://github.com/2O2L2H/gdb-switcher.git
$ git submodule init
$ ./setup.sh
```








