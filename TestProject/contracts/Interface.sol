// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

interface IERC20 {

    //declare the setTotalSupply interface function
     function setTotalSupply(uint256 amount) external;

     //declare the totalSupply interface function to output the totalSupply
     function totalSupply() external view returns (uint256);
}

contract Token is IERC20{

    uint256 _totalSupply;

    //declaring this function must include the override keyword since we
    //are extending an interface
    function setTotalSupply(uint256 amount_) external override{
        _totalSupply = amount_;
    }
    //declaring this function must include the override keyword since we
    //are extending an interface
    function totalSupply() external view override returns (uint256) {
    return _totalSupply;
  }
}
