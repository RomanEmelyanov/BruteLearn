rm -rf $HOME/.hashcat/hashcat.potfile
# https://hashcat.net/wiki/doku.php?id=example_hashes
hashcat --potfile-disable -m 10700 -a 3 pdf_hash.txt -i ?d?d?d?d?d

#rm -rf ./JtR/john.pot
#./JtR/john --incremental=digits pdf_hash.txt
