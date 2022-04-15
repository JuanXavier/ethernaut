// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
  
    // For bypassing this requirement, we can create a contract that acts as msg.sender
    // since only an EOA will act as tx.origin    
    if (tx.origin != msg.sender) {
          owner = _owner;
    }
  }
}