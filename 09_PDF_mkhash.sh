if [ ! -x "/usr/bin/convert" ]; then
 echo "ERROR: ImageMagick (convert) required"
 exit
fi

echo Algo: PDF 
echo Pass: $1
rm -rf test.ps test.pdf

if [ 0 ]; then
 convert xc:none -page Letter test.ps
 # ps2pdf12 -sOwnerPassword=$1 test.ps test.pdf
 ps2pdf13 -sOwnerPassword=$1 -sUserPassword=$1 test.ps test.pdf
 # ps2pdf14 -dEncryptionR=3 -dKeylength=128 -sOwnerPassword=$1 -sUserPassword=$1 test.ps test.pdf
 ./JtR/pdf2john.pl test.pdf | cut -f 2 -d ':' | sed s/\*4294967292/*-4/ > pdf_hash.txt
else
 convert xc:none -page A4 test.pdf
 qpdf --encrypt $1 $1 40 -- test.pdf test1.pdf
 # qpdf --encrypt $1 $1 256 --use-aes=y --force-version=1.7 -- test.pdf test1.pdf
 mv test1.pdf test.pdf
 ./JtR/pdf2john.pl test.pdf | cut -f 2 -d ':' > pdf_hash.txt
fi
cat pdf_hash.txt
