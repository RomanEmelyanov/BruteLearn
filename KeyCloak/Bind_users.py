#!/usr/bin/python3

# 1 PREPARE: cut -d '|' -f 1,9,10 users.txt | tr -d " " > userslist.txt
# 2 PREPARE: hashcat --username -m 20300 4hashcat.txt rockyou.txt --show > ufound.txt
# 3 RUN: ./02_Bind_Users.py | wc -l

uida = {} # user id array: user_id -> "realm\username"

with open('userlist.txt') as f:
 for line in f:
  uid, urealm, uname = line.strip().split('|')
  uida[uid] = urealm + '\\' + uname

with open('ufound.txt') as f:
 for line in f:
  uid, uhash, upass = line.strip().split(':')
  print(uida[uid] + ':' + upass)
  