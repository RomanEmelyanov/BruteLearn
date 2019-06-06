rm -rf logs.txt
exec 1<&-
exec 2<&-
exec 1<>logs.txt
exec 2>&1
uname -a
date
./01_MD5_mkhash.sh 4321 
./02_MD5_brute.sh
./03_SHA512_mkhash.sh 4321
./04_SHA512_brute.sh
./05_ZIP_mkhash.sh 4321
./06_ZIP_brute.sh
./07_OFFICE_mkhash.sh 4321
./08_OFFICE_brute.sh
./09_PDF_mkhash.sh 4321
./10_PDF_brute.sh
date
