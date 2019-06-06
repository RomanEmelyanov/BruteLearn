echo Algo: MD5
echo Pass: $1 
echo -n $1 | openssl md5 | cut -d " " -f 2 > md5_hash.txt
cat md5_hash.txt
