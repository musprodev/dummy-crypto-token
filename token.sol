// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/// @title A Dummy token
/// @author Muspro Dev == E1.Musa.M
/// @dev this is a dummy coin i built with the help of my boss Poles

// This creates the contract named Anycoin
contract TokenGen{
    string public token_name;
    string public token_symbol;
    uint public token_decimal;
    uint public total_supply;

    // the mapping function helps us to make the balance from the address calling the contract an interger
    mapping(address => uint) balance;

    // The constructor function is a special and very important that in this case make the code in it run before any other code when the contract is deployed or called
    constructor(string memory name, string memory symbol, uint decimal, uint totalsupply){
        token_name = name;
        token_symbol = symbol;
        token_decimal = decimal;
        total_supply = totalsupply;

        balance[msg.sender] = total_supply;
    }

    // the fuction getbalance here allows the contract get the balance of the address calling it
    function getBalance() external view returns(uint){
        return balance[msg.sender];
    }

    // transfer function allows anyone to send or transfer the token  
    function transfer(address receiver, uint amount) public{
        require(balance[msg.sender]>=amount, "insufficient funds");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
    }

    // I added this function so an address can check the balance of another address
    function balanceOf(address _account) external view returns(uint){
        return balance[_account];
    }







} 
