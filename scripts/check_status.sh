NETWORK=alpha-goerli

if [[ $2  ]]; then
  NETWORK=$2
fi

starknet tx_status --hash $1 --network $NETWORK