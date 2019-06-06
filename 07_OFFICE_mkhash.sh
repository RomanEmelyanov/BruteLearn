echo Algo: MS Office 2013 
echo Pass: $1
./JtR/office2john.py test.docx | cut -d ':' -f 2 > office_hash.txt
cat office_hash.txt
