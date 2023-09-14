# rm -rf $HOME/.hashcat/hashcat.potfile
# https://hashcat.net/wiki/doku.php?id=example_hashes
hashcat --potfile-disable -m 17210 -a 3 zip_hash.txt ?d?d?d?d

#export JOHN=./JtR/john
#rm -rf ./JtR/john.pot
#$JOHN --incremental=digits zip_hash.txt
