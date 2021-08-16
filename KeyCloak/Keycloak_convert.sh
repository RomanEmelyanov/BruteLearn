#!/usr/bin/python3

# cut half (512->256) hash for hashcat 20300
# 1 PREPARE: cut -d '|' -f 4,6,7 passwords.txt | tr -d " " > pass.txt
# 2 RUN: ./Keycloak_Convert.py > 4hashcat.txt
# 3 BRUTE: hashcat --username -m 20300 4hashcat.txt rockyou.txt

import base64, sys
with open('pass.txt') as f:
 for line in f:
  salt, b64hash, username = line.strip().split("|")
  b64salt = base64.b64encode(bytes.fromhex(salt[2:]))
  b64hash = base64.b64encode(base64.b64decode(b64hash)[:32]).decode('ascii')
  print(username + ':$pbkdf2-sha256$27500$' + b64salt.decode('ascii')[:-2].replace('+', '.') + '$' + b64hash[:-1].replace('+', '.'))
