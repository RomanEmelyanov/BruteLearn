
# apt install imagemagic qpdf

if [ ! -x "/usr/bin/convert" ]; then
 echo "ERROR: ImageMagick (convert) required"
 exit
fi

echo Algo: PDF 
echo Pass: $1
rm -rf test.pdf

# on error: 'convert-im6.q16: attempt to perform an operation not allowed by the security policy `PDF' @ error/constitute.c/IsCoderAuthorized/421.'
# <policy domain="coder" rights="read | write" pattern="PDF" />
# just before </policymap> in /etc/ImageMagick-7/policy.xml 

 convert xc:none -page A4 test.pdf
 qpdf --encrypt $1 $1 256 -- test.pdf test1.pdf
 mv test1.pdf test.pdf
 ./JtR/pdf2john.pl test.pdf | cut -f 2 -d ':' > pdf_hash.txt

cat pdf_hash.txt
