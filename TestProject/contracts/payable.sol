// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract Payable{

            //this function sends ether to a smart contract
            function sendEther() external payable{
            }

            //this function sends ether to a smart contract
            function sendEtherAmt(uint256 _amount) external payable {
                //require()
               //subtract from the ether balance
               msg.sender.balance - _amount;
               //add the balance to the contract address
               address(this).balance + _amount;
            }

           //this function gets the balance of the msg.sender
            function getBalance() external view returns (uint256){
                return msg.sender.balance;
            }

            //this function retrieves the balance of the contract
            function getContractBalance() external view returns (uint256){
                return address(this).balance;
            }

             //transfering ether from this contract to another address
             function transferEthertoContract(address payable recipient) external payable{
                recipient.transfer(msg.value);
            }

        //this function retrieves the balance of the contract
        /*function sendEtherAmt2(uint256 _amount) external view returns (uint256){
            uint256 balance;
            msg.sender.balance - _amount;
            balance = address(this).balance + _amount;
            balance += balance;
            return balance;
        }*/

}
