// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.4;

contract ERC20 {
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  uint256 public totalSupply;

  mapping(address => uint256) private balances;

  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  function balanceOf(address _owner) external view returns (uint256) {
    return balances[_owner];
  }

  function transfer(address _to, uint256 _value) external returns (bool){
    _transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) external returns (bool) {
    _transfer(_from, _to, _value);
    return true;
  }

  function _transfer(address _from, address _to, uint256 _value) private {
    require(_value <= balances[_from], "Insufficient balance");
    require(_from != _to, "from = to");
    balances[_from] -= _value;
    balances[_to] += _value;
    emit Transfer(_from, _to, _value);
  }
}