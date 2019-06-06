# rm -rf $HOME/.hashcat/hashcat.potfile
# hashcat -m 13600 -a 3 zip_hash.txt ?d?d?d?d?d?d?d?d

#export JOHN=john
#rm $HOME/.john/john.pot

export JOHN=./JtR/john
rm -rf ./JtR/john.pot
$JOHN --incremental=digits zip_hash.txt
