export JOHN=./JtR/zip2john
# export JOHN=zip2john

echo Algo: ZIP 
echo Pass: $1
echo test > test.txt
zip -e -P $1 test.zip test.txt
rm -rf test.txt
$JOHN test.zip | cut -d ':' -f 2 > zip_hash.txt
cat zip_hash.txt

