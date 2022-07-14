// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/BadgeFactory.sol";
import "src/Dao.sol";

contract BadgeFactoryTest is Test {
    BadgeFactory badgeFactory;
    Dao dao;

    function setUp() public {
        badgeFactory = new BadgeFactory();
        bytes32 root = 0x886e1015e4bc80a235913240cc3412aa9bddc610da91f29556e8e85fe5028080;
        dao = new Dao(root);
    }

    function testMint() public {
        bytes32[] memory proof = new bytes32[](4);
        proof[0] = 0xb6711c87f5d70aa0ec9dcbff648cab4ede7aec7218e4e2fef065f83253fc9108;
        proof[1] = 0x341f5aafc52e7a6d9695a50a4d315488fa8ee4239dbd0812bca78b22857c05a3;
        proof[2] = 0x7272be4ededee2978779945420cb4f18e116a69855757b15bb6ddcc83efb40c0;
        proof[3] = 0xa22d2d4af6076ff70babd4ffc5035bdce39be98f440f86a0ddc202e3cd935a59;

        badgeFactory.mint(dao, proof);
        assertTrue(true);
    }
}
