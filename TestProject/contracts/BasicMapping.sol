// SPDX-License-Identifier: MIT 

pragma solidity ^0.6.0;

contract MappingData{
    
    //initialize a mapping called studentBalance
    mapping(address => uint) studentBalance;
    //the wallet mapping is what is known as a nested mapping
    mapping(address => mapping(address => uint)) wallet;
    
    //store a value into the map
    function setBalance(uint _amount) public {
        studentBalance[msg.sender] = _amount;
    }
    
    //retrieve a value from the map
    function retrievBalance() public view returns(uint){
        return (studentBalance[msg.sender]);
    }
    
    /*store a value for a specific user
    */
    function setUserAmount(address _user, uint _amount) public{
        studentBalance[_user] = _amount;
    }
    
    /*retrieve a particular amount stored in the map
    */
    function retrieveUserBalance(address _user) public view returns(uint){
        return(studentBalance[_user]);
    }
    
    //store a value into the double map
    //we will store the amount into a wallet wallet[msg.sender][_coin]
    function saveTowallet(address _coin, uint _amount) public{
        wallet[msg.sender][_coin] = _amount;
    }
    
    //retrieve amount stored in the wallet
    function retrieveWalletBalance(address _coin) public view returns (uint){
        return (wallet[msg.sender][_coin]);
    }
}
