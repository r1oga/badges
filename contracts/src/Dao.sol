// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Dao {
    bytes32 public root;

    constructor(bytes32 _root) {
        root = _root;
    }
}
