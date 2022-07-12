// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "oz/MerkleProof.sol";

contract Badge {
    address dao;
    address owner;

    constructor(address _dao, address _owner) {
        dao = _dao;
        owner = _owner;
    }
}
