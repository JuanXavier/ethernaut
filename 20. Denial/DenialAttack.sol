// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
 
contract DenialAttack {

    /*
    ----------How to send Ether?------------
    You can send Ether to other contracts by

    a) transfer (forwards 2300 gas to the contract being called for emitting an event,
        throws error if receiveng contract doest not have fallback or receive function)---> address must be payable

    b) send (2300 gas, returns bool instead of throwing an error) ---> address must be payable

    c) call (allow to call any other function on a contract, as long as its public or external, 
        you can specify the amount of gas used, returns bool)  --->

        .call{value: msg.value}("")  ---> if there is no signature, it will transfer eth
        .call{value: msg.value}("function_signature")
    
    ------------How to receive Ether?----------------
    A contract receiving Ether must have at least one of the functions below

    receive() external payable
    fallback() external payable

    receive() is called if msg.data is empty, otherwise fallback() is called.


    --------ERROR-----------
    in 0.6.0
    require and revert undo the changes made, meaning it refunds the gas
    assert doest not refund the gas value

    */

    receive() external payable {
        assert(false);
    }
}