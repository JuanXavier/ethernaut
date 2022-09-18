/*Tools needed for this level:
- Remix IDE
-Console

1.- Get vault address for deployment of attacker contract via console.
await contract.cryptoVault()

2.- Deploy this contract (DetectionBot.sol) passing the vault address to its constructor.

3.- Get Forta contract address.
forta = await contract.forta()

3.- Declare the selector of the function we need to call on Forta contract to set our bot.
selector = await web3.eth.abi.encodeFunctionSignature("setDetectionBot(address)")

4.- Declare the parameter of the function, (DetectionBot's contract address padded with zeros 
to make a total of 32 bytes, removing the "0x" at the beginning).
parameter = "0".repeat(24) + "replace_with_deployed_bot_address".slice(2)

5.- Concatenate selector and paramater to make data which will be passed.
data = selector + parameter

6.- Set our detectionBot on Forta contract.
await web3.eth.sendTransaction({from: player, to: forta, data: data})
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./DoubleEntryPoint.sol";

contract DetectionBot is IDetectionBot {
	address public immutable vault;

	constructor(address _vault) {
		vault = _vault;
	}

	function handleTransaction(address user, bytes calldata msgData) external override {
		address to;
		uint256 value;
		address origSender;

		// decode msgData params, loading them from their calldata location
		assembly {
			to := calldataload(0x68)
			value := calldataload(0x88)
			origSender := calldataload(0xa8)
		}

		// If the sender is vault address, raise an alert for the attempt to transfer the
		// underlying token via the legacy token.
		if (origSender == vault) {
			Forta(msg.sender).raiseAlert(user);
		}
	}
}
