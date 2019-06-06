echo Algo: SHA-512 
echo Pass: $1 
echo -n $1 | openssl sha512 | cut -d " " -f 2 > sha512_hash.txt
cat sha512_hash.txt
