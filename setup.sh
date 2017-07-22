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
echo -e "\n[+] legacy gdb"
echo "source ~/.gdbinit-my" > ~/.gdbinit-gdb

# gef
echo -e "\n[+] gef"
#git submodule add https://github.com/hugsy/gef.git
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
gefInit="~/.gdbinit-gef.py"
echo "source "$gefInit > ~/.gdbinit-gef
echo "source ~/.gdbinit-my" >> ~/.gdbinit-gef

echo -e "\n[+] peda"
pedaInit=$PWD"/peda/peda.py"
echo "source "$pedaInit > ~/.gdbinit-peda
echo "source ~/.gdbinit-my" >> ~/.gdbinit-peda

echo -e "\n[+] pwndbg"
pwndbgInit=$PWD"/pwndbg/gdbinit.py"
echo "source "$pwndbgInit > ~/.gdbinit-pwndbg
echo "source ~/.gdbinit-my" >> ~/.gdbinit-pwndbg

echo -e "\n[+] gdb-switcher configuration ~/.bashrc"
cat <<'EOF' >> ~/.bashrc

# gdbs : gdb-switcher
function gdbs() {

      echo "\n[*] Which debugger ?"
      echo "1 : Legacy GDB"
      echo "2 : peda"
      echo "3 : gef"
      echo "4 : pwndbg"
      echo "5 : radare2"

      read choice
      case $choice in
          1) echo "[*] gdb-switch : gdb"
             cp ~/.gdbinit-gdb ~/.gdbinit
             if [ "$#" -eq 2 ]; then
                 gdb -q $2
             fi
             ;;
          2) echo "[*] gdb-switch : peda"
                 cp ~/.gdbinit-peda ~/.gdbinit
             if [ "$#" -eq 2 ]; then
                 gdb -q $2
             fi
             ;;
          3) echo "[*] gdb-switch : gef"
                 cp ~/.gdbinit-gef ~/.gdbinit
             if [ "$#" -eq 2 ]; then
                 gdb -q $2
             fi
             ;;
          4) echo "[*] gdb-switch : pwndbg"
                 cp ~/.gdbinit-pwndbg ~/.gdbinit
             if [ "$#" -eq 2 ]; then
                 gdb -q $2
             fi
             ;;
          5) echo "[*] gdb-switch : radare2"
             if [ "$#" -eq 2 ]; then
                 r2 $2
             fi
             ;;
      esac
}
EOF

echo -e "\n[+] Source .bashrc again for using new gdbs configuration."
source ~/.bashrc

echo -e "\n[+] DONE."
