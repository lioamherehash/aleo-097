#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of three parties.

The private key and address of the first bidder.
private_key: APrivateKey1zkp8mU734cDgW3KXshzgLFgRgPJ5XYywHea6c9w4Tz26rp9
address: aleo18gn0gmw8qx8zd64kzd48gs5adpkp5vhpmujrjx4rkhkfpv0kmsqsjwwe3r

The private key and address of the second bidder.
private_key: APrivateKey1zkp7jSHyGWhi2Fqj4wpYcD1x5QccjUYqRUnr1249Xhwr8CA
address: aleo1c0yd29dm83hh4fzlme5lhtmam44kuuugklhtamce03zn59t57ursjal0w6

The private key and address of the auctioneer.
private_key: APrivateKey1zkpD7tpZ22Z7rHVCVCFLkXB9D91ZVhHFN81CmJp1DptgAAL
address: aleo1lur03kl9w5nvhk6hgfgnlv03a8hrtkt4j66ua04k2fzgsdnszv8qvncmwt
"

echo "
Let's start an auction!

###############################################################################
########                                                               ########
########           Step 0: Initialize a new 2-party auction            ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |         |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Let's take the role of the first bidder - we'll swap in the private key and address of the first bidder to .env.

# We're going to run the transition function "place_bid", slotting in the first bidder's public address and the amount that is being bid. The inputs are the user's public address and the amount being bid.

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp8mU734cDgW3KXshzgLFgRgPJ5XYywHea6c9w4Tz26rp9
ADDRESS=aleo18gn0gmw8qx8zd64kzd48gs5adpkp5vhpmujrjx4rkhkfpv0kmsqsjwwe3r
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run place_bid $ADDRESS 27u64


echo "
###############################################################################
########                                                               ########
########         Step 1: The first bidder places a bid of 10           ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |    27   |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

#

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp7jSHyGWhi2Fqj4wpYcD1x5QccjUYqRUnr1249Xhwr8CA
ADDRESS=aleo1c0yd29dm83hh4fzlme5lhtmam44kuuugklhtamce03zn59t57ursjal0w6
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

# Have the second bidder place a bid of 90.
leo run place_bid $ADDRESS 52u64

echo "
###############################################################################
########                                                               ########
########          Step 2: The second bidder places a bid of 90         ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   27    |   52    |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

