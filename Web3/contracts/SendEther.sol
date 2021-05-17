//useful links
//https://solidity-by-example.org/sending-ether/
//https://solidity-by-example.org/fallback/
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract SendEther{
    string public functionCalled;

    //this function transfers ether from msg.sender to this contract
    function sendEther() external payable{
        functionCalled = 'ether received';
    }
    //the fallback and receie function allows us to send ether directly without getting
    //errors
    //a receive function that must be included if a fallback function is added
    receive() external payable{
        functionCalled = 'receive function';
    }
    //this is a fallback function to allow  us receive ether
    fallback() external payable{
        functionCalled = 'fallback called';
    }
    //get the ethBalance of this smart contract
    function getEthBalance() public view returns (uint256){
        return address(this).balance;
    }
    //sending ether via call
    function sendEthViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
