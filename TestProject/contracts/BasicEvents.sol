// SPDX-License-Identifier: MIT 

pragma solidity ^0.6.0;

contract Events{
    /*
    declaring a simple event*/
    event Transfer(address sender, address receiver, uint amount);
    
    /*declaring an event with the indexed keyword allows you to search for a specific event
    when mmulitple events are fired.
    */
    event TransferFrom(address indexed sender, address indexed receiver, uint amount);
    
    function transfer(address _receiver, uint _amount) public{
        /*
        after the event is declared it is then emitted 
        */
        emit Transfer(msg.sender, _receiver, _amount);
    }
    
    function transferFrom(address _sender, address _receiver, uint _amount) public {
        emit TransferFrom(_sender, _receiver, _amount);
    }
    
}
