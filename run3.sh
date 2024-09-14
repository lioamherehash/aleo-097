#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpD7tpZ22Z7rHVCVCFLkXB9D91ZVhHFN81CmJp1DptgAAL
ADDRESS=aleo1lur03kl9w5nvhk6hgfgnlv03a8hrtkt4j66ua04k2fzgsdnszv8qvncmwt
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run finish "{
  owner: aleo1lur03kl9w5nvhk6hgfgnlv03a8hrtkt4j66ua04k2fzgsdnszv8qvncmwt.private,
  bidder: aleo1c0yd29dm83hh4fzlme5lhtmam44kuuugklhtamce03zn59t57ursjal0w6.private,
  amount: 52u64.private,
  is_winner: false.private,
  _nonce: 8052304605460112803777598849851455388912415646718539839690733493454851360296group.public
}"
