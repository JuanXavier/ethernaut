/*Tools needed for this level:
- Console
*/

// 1.- Declare the bytecode on the console. Here are two possible bytecodes
// 		 equally effective. (Each bytecode is made out of the concatenation of
//  	 creation code + runtime code)
bytecode1 = "600a600c600039600a6000f3602a60505260206050f3"

/* CREATION CODE ===> 60 0a 60 0c 60 00 39 60 0a 60 00 f3

60 ===> push
0a ===> size of the runtime code (0x0a is 10 bytes in hexadecimal) 
60 ===> push
0c ===> current position of runtime code (INTIALLY UNKNOWN)
60 ===> push
00 ===> destination position of the code in memory
39 ===> codecopy (copies runtime code from stack to memory)
60 ===> push
0a ===> size of the runtime code (0x0a is 10 bytes in hexadecimal) 
60 ===> push
00 ===> location of value in memory slot 0x00
f3 ===> return

RUNTIME CODE ===> 60 2a 60 50 52 60 20 60 50 f3

60 ===> push
2a ===> value (0x2a is "42" in hexadecimal)
60 ===> push
50 ===> memory slot (arbitrarily picked)
52 ===> mstore (sore in memory)
60 ===> push
20 ===> size of the value in bytes ("42" is 32 bytes or 0x20)
60 ===> push
50 ===> location in memory slot
f3 ===> return
*/

bytecode2 = "69602a60005260206000f3600052600a6016f3"

/* 
CREATION CODE ===> 69 60 2a 60 00 52 60 20 60 00 f3 

69 ===> push 10 bytes
60 ===> push
2a ===> hex value of "42"
60 ===> push
00 ===> storage destination in memory
52 ===> mstore
60 ===> push
20 ===> size (32 bytes in hex)
60 ===> push
00 ===> location in memory
f3 ===> return

RUNTIME CODE ===> 60 00 52 60 0a 60 16 f3

60 ===> push
00 ===> position in memory
52 ===> mstore
60 ===> push
0a ===> value ("42" in hex value)
60 ===> push
16 ===> location of bytestring at slot 0 ("22" in hex) 
f3 ===> return
*/

// 2.- Create the contract passing the selected buytecode as the data
tx = await web3.eth.sendTransaction({ from: player, data: bytecode })

// 3.- Obtain the address of the created contract.
solverAddr = tx.contractAddress

// 4.- Set the new contract as the solver.
await contract.setSolver(solverAddr)
