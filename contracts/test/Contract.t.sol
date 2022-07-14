// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/BadgeFactory.sol";

contract BadgeFactoryTest is Test, BadgeFactory {
    BadgeFactory badgeFactory;

    function setUp() public {
        badgeFactory = new BadgeFactory();
    }

    function testMint() public {
        bytes32 root = 0x2ae9efca45f3a7da572709783990f9f257391d63056dcf0ef4a5075a2a9e22f9;
        bytes32 leaf = 0x51494c771c377610540e8b9b86186216a64dcf73a7ab57ec2c5953286f059f60;

        bytes32[] memory proof = new bytes32[](4);
        proof[0] = 0x1ebaa930b8e9130423c183bf38b0564b0103180b7dad301013b18e59880541ae;
        proof[1] = 0x37c9fd97568ae28e871e57391543f75b1a84ff2c4b40388678a55a1c5c9b110e;
        proof[2] = 0xc230f68c08483da5b1e1aad58b5e0714848aedeac65ea8f1d7fd993cc74fc62b;
        proof[3] = 0x9e1d84ca9c7548b9920bc4881db28863cc28dcc8447bac67b0881621aa70ac1b;


        badgeFactory.mint(msg.sender, proof, root, leaf);
        assertTrue(true);
    }
}
