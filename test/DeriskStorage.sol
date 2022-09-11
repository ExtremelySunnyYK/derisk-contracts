// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

import {DeriskStorage} from "src/DeriskStorage.sol";

contract DeriskStorageTest is Test {
    using stdStorage for StdStorage;

    DeriskStorage derisk;

    function setUp() external {
        derisk = new DeriskStorage();
    }

    // Test create protocol
    function testCreateProtocol() external {
        derisk.addProtocol("Aave", "ipfs://QmZ1");
        Assert.equal(
            derisk.data("Aave"),
            "ipfs://QmZ1",
            "Protocol should be created"
        );
    }

    // Test Create Duplicate Protocol should fail
    function testCannotCreateDuplicateProtocol() external {
        derisk.addProtocol("Aave", "ipfs://QmZ1");
        Assert.equal(
            derisk.data("Aave"),
            "ipfs://QmZ1",
            "Protocol should be created"
        );
        derisk.addProtocol("Aave", "ipfs://QmZ2");
        // Assert Fails
        vm.expectRever(bytes("Protocol already exists"));
    }

    // Test update protocol
    function testUpdateProtocol() external {
        derisk.addProtocol("Aave", "ipfs://QmZ1");
        derisk.updateProtocol("Aave", "ipfs://QmZ2");
        Assert.equal(
            derisk.data("Aave"),
            "ipfs://QmZ2",
            "Protocol should be updated"
        );
    }

    // Test delete protocol
    function testDeleteProtocol() external {
        derisk.addProtocol("Aave", "ipfs://QmZ1");
        derisk.deleteProtocol("Aave");
        Assert.equal(derisk.data("Aave"), "", "Protocol should be deleted");
    }
}
