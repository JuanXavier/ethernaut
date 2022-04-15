// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Receiver {

    constructor() payable {

    }

    function die () public {
        selfdestruct(payable(0x317283EE2f15c20cfFcCA2d718Ca4bA5451ED2A7));
    }
}