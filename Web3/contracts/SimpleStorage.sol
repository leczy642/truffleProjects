// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract SimpleStorage {

  uint256 private value;

  constructor (uint256 _value) public{
    value = _value;
  }

  function setValue(uint256 _value) public {
    value = _value;
  }

  function getValue() public view returns (uint256){
    return value;
  }

}
