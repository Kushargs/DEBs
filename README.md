# Distributed Electoral Bonds

## Electoral Bonds

Electoral Bonds are a special form of interest free promis-
sory notes introduced in Finance Bill, 2017 by the BJP-led
NDA government as a tool to assist political funding. Similar
to Bank notes, they are payable to the bearer and are issued
by State Bank of India (SBI). Any citizen of India or a body
incorporated in India can purchase them after fulfilment of
KYC norms and by making payment form a bank account at
the start of a financial quarter from specified branches of the
SBI and can be en-cashed by any registered political party in
period of 15 days from the date of issue at the SBI. A electoral
bond contains the information about its value (in the multiples
of|1,000,|10,000,|1,00,000,|10,00,000 and|1,00,00,000 )
, date of issue and a unique bond number. As electoral bonds
does not hold the name of the purchaser, any individual can
make an anonymous donation to a political party.
These Bonds can only be issued and claimed at SBI. 
This introduces a centralized trusted entity, which can lead
to Denial of Service and also risks data privacy issues. They
are also have been heavily criticised for potential of being
bias towards the ruling party. The anonymity of the
electoral bonds is only for the broader public. The
bonds are sold via a government-owned bank, this
makes it just a matter of matching bond numbers to
identify who is funding what party.

We introduce a Ethereum based distributed application
(DEBs) as an alternative instrument for political funding.

## DISTRIBUTED ELECTORAL TOKENS
### Structure
1) Addresses:There are two types of addresses:
- Common addresses: These are the addresses who can
    create bonds. Anyone can register as a common address.
    Common addresses
- Party addresses: These are the addresses who can claim
    the bonds. These addresses are linked to the registered
    political parties by EC. EC has the authority of deciding
    who can become a political party.
2) Tokens: Tokens are the units of the bonds. In our de-
centralized application, they are scripts which have following
properties:
- Value: Value of the bond in the currency of the mode.
This is fixed.
- Token Type: This denotes the type of the mode the token
was bought using. Thus, an ETHtoken is issued using an
ethereum transfer.
- Owner: Owner of the token, the tokens are signed by one
of the common addresses.
3) Decentralized Issuer (DeIssr): 
- DeIssr is a Dapp that issues tokens for a common address. They can 
provide various modes of payments depending on the preferences
of the user. We will use crypto transfer using eth to get tokens.
The tokens can be claimed by the same method with which
they were issued.
- Crypto Transfer (Eth): DeIssrs maintain multiple ad-
dresses in the corresponding crypto chain and a transfer
to DeIssr is issued on their behalf of these addresses. A
drawback of crypto transfer is that the value of tokens
will fluctuate.

```
REFERENCES
[1] Jain, Reema. ”Electoral Bonds: A Key-Hold Analysis.” Issue 2 Int’l JL
Mgmt. Human. 4 (2021): 419.
[2] Sahu, Barkha Shravani. ”Electoral Bonds and Corruption Involved in
It.” Supremo Amicus 24 (2021): 672.
[3] Nakamoto, S. (2008) Bitcoin: A Peer-to-Peer Electronic Cash System.
https://bitcoin.org/bitcoin.pdf
```


