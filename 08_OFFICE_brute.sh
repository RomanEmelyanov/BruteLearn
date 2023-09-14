# rm -rf $HOME/.hashcat/hashcat.potfile
# https://hashcat.net/wiki/doku.php?id=example_hashes
hashcat --potfile-disable -m 9600 -a 3 office_hash.txt ?d?d?d?d

#rm -rf ./JtR/john.pot
#./JtR/john office_hash.txt
