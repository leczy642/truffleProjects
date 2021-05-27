//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ChangeOwnerShip{
    
    //declare the owner variable
    address private owner;
    uint private val;
    
    constructor () public{
        owner = msg.sender;
    }
    
    //declare a modifier that states that
    //owner must be equal msg.sender
    modifier OnlyOwner{
        require(owner == msg.sender, "You are not the owner of this contract");
        _;
    }
    
    //create a function to illustrate how it works 
    function changeOwner(address _newOwner) public OnlyOwner {
        owner = _newOwner;
    }
    
    function storeNum(uint _num) public OnlyOwner {
        val = _num;
    }
    
    function retreiveNum() public view returns (uint){
        return val;
    }
}
