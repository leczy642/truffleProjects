// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract SolidityArrays{

  uint256[] public ids;

  function add(uint256 _id) public{
    ids.push(_id);
  }

  function get(uint256 _id) view public returns(uint256){
    return ids[_id];
  }

  function getAll() view public returns (uint256[] memory){
      return ids;
  }

  function getLength() view public returns(uint256){
    return ids.length;
  }
}
