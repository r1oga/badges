// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Badge.sol";
import "oz/MerkleProof.sol";

contract BadgeFactory {
    using MerkleProof for bytes32[];

    Badge[] badges;

    event Mint(address dao, address to);

    constructor() {}

    function mint(
        address dao,
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) external {
        require(proof.verify(root, leaf), "not whitelisted");

        Badge badge = new Badge(dao, msg.sender);
        badges.push(badge);

        emit Mint(dao, msg.sender);
    }
}
