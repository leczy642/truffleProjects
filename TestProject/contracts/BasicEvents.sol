// SPDX-License-Identifier: MIT 
//usefull links 
//https://www.youtube.com/watch?v=BduMOagAuKs&t=21s
//https://www.youtube.com/watch?v=jaMHPT-78HM
//https://www.youtube.com/watch?v=L5Au5DY8eL4
//https://www.youtube.com/watch?v=CX2QOE0FcEo&t=46s
//https://www.youtube.com/watch?v=oQ5yPKdjxFQ
//https://www.youtube.com/watch?v=HGw-yalqdgs
//https://bit.ly/3hV8wAa
//https://betterprogramming.pub/learn-solidity-events-2801d6a99a92

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
