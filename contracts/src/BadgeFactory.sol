// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Badge.sol";
import "oz/MerkleProof.sol";

contract BadgeFactory {
    using MerkleProof for bytes32[];

    Badge[] badges;

    function mint(
        address dao,
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) external {
        require(proof.verifyCalldata(root, leaf), "not whitelisted");

        Badge badge = new Badge(dao, msg.sender);
        badges.push(badge);
    }
}
