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

leo run resolve "{
 owner: aleo1lur03kl9w5nvhk6hgfgnlv03a8hrtkt4j66ua04k2fzgsdnszv8qvncmwt.private,
  bidder: aleo18gn0gmw8qx8zd64kzd48gs5adpkp5vhpmujrjx4rkhkfpv0kmsqsjwwe3r.private,
  amount: 27u64.private,
  is_winner: false.private,
  _nonce: 5994767300544222168601356194112676583161706457102443853998394509677991288579group.public
}" "{
   owner: aleo1lur03kl9w5nvhk6hgfgnlv03a8hrtkt4j66ua04k2fzgsdnszv8qvncmwt.private,
  bidder: aleo1c0yd29dm83hh4fzlme5lhtmam44kuuugklhtamce03zn59t57ursjal0w6.private,
  amount: 52u64.private,
  is_winner: false.private,
  _nonce: 6032635854659947720052823116708999920741271629907832153144738379314808085776group.public
}"
