NETWORK=alpha-goerli
SOURCE="${BASH_SOURCE%%/*}"


 if [[ $2  ]]; then
   NETWORK=$2
 fi
 
 echo "=== declaring contract start ==="
 starknet declare --contract $1 --network $NETWORK
 
 echo "=== deploying contract start ==="
 DEPLOY_DATA=$(starknet deploy --contract $1 --no_wallet --network $NETWORK)
 CONTRACT_ADDRESS=$(echo $DEPLOY_DATA | awk '{print $7}')
 TX_HASH=$(echo $DEPLOY_DATA | awk '{print $10}')
 
echo "contract: $CONTRACT_ADDRESS"
echo "tx: $TX_HASH"
# 
bash "$SOURCE/check_status.sh" $TX_HASH $NETWORK