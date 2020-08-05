#!/bin/bash

# Add the GitHub user accounts
USERS=()
USER_ACCT=ubuntu # Could set to $USER where needed
USER_SSHDIR=/home/$USER_ACCT/.ssh

sudo apt update
sudo apt install -y jq
sudo mkdir -p $USER_SSHDIR

for USER in "${USERS[@]}" 
do
    echo "### Retrieving keys for Github Account $USER ###"
    RESPONSE=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/users/$USER/keys)
    for row in $(echo "${RESPONSE}" | jq -r '.[] | @base64') 
    do
        _jq() {
            echo ${row} | base64 --decode | jq -r ${1}
        }
        KEY=$(_jq '.key')
        KEY_NAME=$(_jq '.id')
        echo $KEY >> $USER_SSHDIR/authorized_keys
    done
done