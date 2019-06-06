# pass 4321 - 1 min, 40 secs
#rm -rf $HOME/.hashcat/hashcat.potfile
#hashcat -m 9600 -a 3 office_hash.txt ?d?d?d?d

rm -rf ./JtR/john.pot
./JtR/john office_hash.txt
