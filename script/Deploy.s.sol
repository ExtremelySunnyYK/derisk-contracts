// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";

import {DeriskStorage} from "src/DeriskStorage.sol";

/// @notice A very simple deployment script
contract Deploy is Script {
    /// @notice The main script entrypoint
    function run() external returns (DeriskStorage deriskStorage) {
        vm.startBroadcast();
        deriskStorage = new DeriskStorage();
        vm.stopBroadcast();
    }
}
