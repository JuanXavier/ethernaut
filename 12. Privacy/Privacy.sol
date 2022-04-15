// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy {

  bool public locked = true; // 0x0000000000000000000000000000000000000000000000000000000000000001
  uint256 public ID = block.timestamp; // 0x0000000000000000000000000000000000000000000000000000000061fad6fe
  
  uint8 private flattening = 10;// 0x00000000000000000000000000000000000000000000000000000000d6feff0a
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  
  bytes32[3] private data;  //0xd52cbd3aa264c20ae6c707ae5c599b2393dfba45a440cacbad581026141aaa3a
  //0xd8e8bc71c882139b37e5c3af8a0116c5b9a7bef647d68bb75c63f0c116f2d317
  //0x685646df802e24bdd1574826b52afa65d0130a68600c810d8bd415110e28048c

  constructor(bytes32[3] memory _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}