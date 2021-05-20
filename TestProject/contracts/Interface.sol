// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

interface IERC20 {

     function setTotalSupply(uint256 amount) external;

     function totalSupply() external view returns (uint256);
}

contract Token is IERC20{

   uint256 _totalSupply;
    function setTotalSupply(uint256 amount_) external override{
        _totalSupply = amount_;
    }
    function totalSupply() external view override returns (uint256) {
    return _totalSupply;
  }
}
    
