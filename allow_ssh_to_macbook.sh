#!/usr/bin/env bash

# Add all public keys to authorized key file
echo '# Authorized Keys' > ~/.ssh/authorized_keys
for i in $(ls ~/.ssh | grep '.pub')
do
    cat ~/.ssh/$i >> ~/.ssh/authorized_keys
done


