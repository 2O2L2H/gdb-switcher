# .gdbinit backup
echo "[*] Backup ~/.gdbinit"
NOW=$(date +"%Y-%M-%d")
cp ~/.gdbinit ~/.gdbinit".backup@"$NOW

# gef
echo -e "\n[*] gef"
git submodule add https://github.com/hugsy/gef.git
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
gefInit="~/.gdbinit-gef.py"
echo "source "$gefInit > ~/.gdbinit-gef

echo -e "\n[*] peda"
git submodule add https://github.com/longld/peda.git
pedaInit=$PWD"/peda/peda.py"
echo "source "$pedaInit > ~/.gdbinit-peda

echo -e "\n[*] pwndbg"
#git submodule add https://github.com/pwndbg/pwndbg.git
#(cd pwndbg && ./setup.sh)
pwndbgInit=$PWD"/pwndbg/gdbinit.py"
echo "source "$pwndbgInit > ~/.gdbinit-pwndbg

echo -e "\n[*] gdb-switcher configuration ~/.bashrc"
cat <<'EOF' >> ~/.bashrc

# gdbs : gdb-switcher
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
EOF
