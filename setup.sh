# .gdbinit backup
echo "[+] Backup ~/.gdbinit"
NOW=$(date +"%Y-%M-%d")
cp ~/.gdbinit ~/.gdbinit".backup@"$NOW

# .gdbinit my configuration
if [ ! -f ~/.gdbinit-my ]; then
    echo "[+] copy .gdbinit-my to ~"
    cp .gdbinit-my ~
fi

# Legacy gdb
echo -e "\n[+] 1. legacy gdb"
echo "source ~/.gdbinit-my" > ~/.gdbinit-gdb

# gef
echo -e "[+] 2. gef"
#git submodule add https://github.com/hugsy/gef.git
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
gefInit="~/.gdbinit-gef.py"
echo "source "$gefInit > ~/.gdbinit-gef
echo "source ~/.gdbinit-my" >> ~/.gdbinit-gef

echo -e "[+] 3. peda"
pedaInit=$PWD"/peda/peda.py"
echo "source "$pedaInit > ~/.gdbinit-peda
echo "source ~/.gdbinit-my" >> ~/.gdbinit-peda

echo -e "[+] 4. pwndbg"
pwndbgInit=$PWD"/pwndbg/gdbinit.py"
echo "source "$pwndbgInit > ~/.gdbinit-pwndbg
echo "source ~/.gdbinit-my" >> ~/.gdbinit-pwndbg

echo -e "[+] gdb-switcher configuration ~/.bashrc"
cat <<'EOF' >> ~/.bashrc

# gdbs : gdb-switcher
function gdbs() {
      echo -e "\n[*] Which debugger ?"
      echo -e "\n1 : Legacy GDB"
      echo "2 : peda"
      echo "3 : gef"
      echo "4 : pwndbg"
      echo "5 : radare2"

      radare="no"

      read choice
      case $choice in
          1) echo "[+] gdb-switch => gdb"
             cp ~/.gdbinit-gdb ~/.gdbinit
             ;;
          2) echo "[+] gdb-switch => peda"
                 cp ~/.gdbinit-peda ~/.gdbinit
             ;;
          3) echo "[+] gdb-switch => gef"
                 cp ~/.gdbinit-gef ~/.gdbinit
             ;;
          4) echo "[+] gdb-switch => pwndbg"
                 cp ~/.gdbinit-pwndbg ~/.gdbinit
             ;;
          5) echo "[+] gdb-switch => radare2"
                  radare="run"
             ;;
      esac

      if [ "$#" -eq 1 ]; then
         if [ "$radare" = "run" ]; then
            echo "[+] debugger execution : radare2"
            r2 $1
         else
            echo "[+] debugger execution"
            gdb -q $1
         fi
      fi
}
EOF

echo -e "\n[+] Source .bashrc again for using new gdbs configuration."
source ~/.bashrc

echo -e "\n[+] DONE."
