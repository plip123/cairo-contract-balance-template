NETWORK=alpha-goerli
SOURCE="${BASH_SOURCE%%/*}"


 if [[ $5  ]]; then
   NETWORK=$5
 fi
 
 
 echo "=== call contract start ==="
 DEPLOY_DATA=$(starknet call --address $1 --abi $2 --function $3 --inputs $4)
 CONTRACT_ADDRESS=$(echo $DEPLOY_DATA | awk '{print $7}')
 TX_HASH=$(echo $DEPLOY_DATA | awk '{print $10}')
 
echo "contract: $CONTRACT_ADDRESS"
echo "tx: $TX_HASH"
# 
bash "$SOURCE/check_status.sh" $TX_HASH $NETWORK