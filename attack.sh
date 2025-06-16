#!/bin/bash

echo "[1] Step 1: trying SSH before knocking (should fail)"
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 student@secure-ssh -p 22 || echo "[!] SSH not available — OK"

echo "[2] Step 2: knocking"
knock 172.18.0.2 17000 18000 19000
sleep 3

echo "[3] Step 3: trying SSH after knocking (should succeed)"
sshpass -p studentpass ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 student@secure-ssh -p 22 -tt 'echo "[+] Logged in"; exit'

echo "[4] Step 4: failing login 3 times"
for i in 1 2 3; do
  sshpass -p wrongpass ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 student@secure-ssh -p 22 || echo "[!] Failed login $i"
done

echo "[5] Step 5: testing ban"
sshpass -p studentpass ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 student@secure-ssh -p 22 || echo "[!] BANNED — FAIL2BAN WORKING"
