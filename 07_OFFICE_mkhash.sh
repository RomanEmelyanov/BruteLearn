echo Algo: MS Office 2013 
echo Pass: $1

# apt install pandoc
# echo "Test" | pandoc -o test.docx
# pip install msoffcrypto-tool
echo 'Set password manually'

if [ ! -f "./office2john.py" ]; then
 wget https://raw.githubusercontent.com/openwall/john/bleeding-jumbo/run/office2john.py
 chmod +x ./office2john.py
fi

./office2john.py test.docx | cut -d ':' -f 2 > office_hash.txt
cat office_hash.txt
