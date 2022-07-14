// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "oz/MerkleProof.sol";
import "./Badge.sol";
import "./Dao.sol";

contract BadgeFactory is Test {
    using MerkleProof for bytes32[];

    Badge[] badges;

    event Mint(address dao, address to);

    constructor() {}

    function mint(Dao dao, bytes32[] memory proof) external {
        bytes32 root = dao.root();
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));

        require(proof.verify(root, leaf), "not whitelisted");

        Badge badge = new Badge(address(dao), msg.sender);
        badges.push(badge);

        emit Mint(address(dao), msg.sender);
    }
}
