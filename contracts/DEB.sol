// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
enum USER_TYPE{ DONOR, PARTY }
enum TOKEN_VALUE{TEN,HUNDRED,THOUSAND}
contract DEB{

    uint id_counter = 0;
    uint256 exchange_rate;
    struct Token{
        uint256 id;
        address owner;
        TOKEN_VALUE value;
    }
    uint party_counter = 0;
    struct Party{
        uint256 id;
        string name;
        bool isValid;
    }
    Token[] unused;
    mapping (address=>USER_TYPE) address_to_usertype_map;
    mapping (string=>address) party_name_to_address;

    event CreatedParty(
        address addr,
        string name
    );
    event CreatedDonor(
        address addr
    );
    event TokenTransfered(
        address donor,
        address party,
        uint token_id,
        TOKEN_VALUE token_value
    );
    event TokenRedeemed(
        address recipient,
        // string name,
        uint token_id,
        TOKEN_VALUE token_value
    );
    event TokenBought(
        address donor,
        uint token_id,
        TOKEN_VALUE token_value
    );


    Party[] parties;
    function registerDonor() external {
        address addr = msg.sender;
        address_to_usertype_map[addr] = USER_TYPE.DONOR;
    }
    

    function registerParty(string calldata name) external {
        address addr = msg.sender;
        address_to_usertype_map[addr] = USER_TYPE.DONOR;
        Party memory party = Party(party_counter,name,false); 
        party_counter++;
        parties.push(party);
        party_name_to_address[party.name] = addr;
        emit CreatedParty(addr,name);
    }

    function issueToken(uint256 token_type) external  payable{
        address payable addr = payable(msg.sender);
        require(address_to_usertype_map[addr] == USER_TYPE.DONOR);
        require(msg.value>=tokenValueToNumber(TOKEN_VALUE(token_type)));
        require(token_type == 0 || token_type == 1 || token_type == 2);
        Token memory token = Token(id_counter,addr,TOKEN_VALUE(token_type));
        id_counter++;
        unused.push(token);
        emit TokenBought(token.owner, token.id, token.value);
    }
    function transferToken(address to,uint256 token_id) external {
        address payable addr = payable(msg.sender);
        require(address_to_usertype_map[addr] == USER_TYPE.DONOR);
        for(uint i=0;i<unused.length;i++){
            if(unused[i].id == token_id){
                require(unused[i].owner==addr);
                unused[i].owner = to;
                emit TokenTransfered(addr, to, unused[i].id, unused[i].value);

                break;
            }
        }
    }
    function redeemToken(uint256 token_id) external payable{
        address payable addr = payable(msg.sender);
        // require(address_to_usertype_map[addr] == USER_TYPE.PARTY, "You are not a party");
        for(uint i=0;i<unused.length;i++){
            if(unused[i].id == token_id){
                
                require(unused[i].owner == addr);
                addr.transfer(tokenValueToNumber(unused[i].value));
                unused[i].owner = address(0);
                emit TokenRedeemed(addr, unused[i].id, unused[i].value);
                break;
            }
        }
    }
    function tokenValueToNumber(TOKEN_VALUE value) internal pure returns(uint256){
        if(value == TOKEN_VALUE.TEN){
            return 10;
        }
        if(value == TOKEN_VALUE.HUNDRED){
            return 100;
        }
        if(value == TOKEN_VALUE.THOUSAND){
            return 1000;
        }
    }
    function viewParties() external view returns(Party[] memory){
        return parties;

    }

    function getPartyAddress(string calldata party_name) external  view returns(address)
    {
        return party_name_to_address[party_name];
    }
    
    function viewTokens() external view returns(Token[] memory){
        return unused;
    }
    
    //-- register as user
    //-- register as party
    //-- issue tokens (send eth as value)
    // -- redeem tokens (transfer eth)
    // -- transfer token from common to party
    // -- a function for party to loot all the money
}