# submodule
echo -e "\n[+] Update submodule : gef, gepda, pwndbg"
git submodule init
git submodule update

# pwndbg
echo -e "\n[+] Install pwndbg"
(cd pwndbg && ./setup.sh)

# radare2 
echo -e "\n[+] Install radare2"
(cd radare2 && ./sys/install.sh)

echo -e "\n[+] Installation DONE."
