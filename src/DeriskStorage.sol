// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

// Restrict updating and deleting data to owner
import "./Ownable.sol";

/// @title DeriskStorage
contract DeriskStorage is Ownable {
    // Mapping of protocol to IPFS link
    mapping(string => string) public data;

    modifier protocolExists(string memory _protocol) {
        require(bytes(data[_protocol]).length > 0, "Protocol does not exist");
        _;
    }

    // Add a new protocol to the mapping
    function addProtocol(string memory _protocol, string memory _ipfsLink)
        public
        onlyOwner
    {
        // check if protocol already exists
        require(bytes(data[_protocol]).length == 0, "Protocol already exists");
        data[_protocol] = _ipfsLink;
    }

    // Update an existing protocol
    function updateProtocol(string memory _protocol, string memory _ipfsLink)
        public
        onlyOwner
        protocolExists(_protocol)
    {
        data[_protocol] = _ipfsLink;
    }

    // Delete an existing protocol
    function deleteProtocol(string memory _protocol)
        public
        onlyOwner
        protocolExists(_protocol)
    {
        delete data[_protocol];
    }
}
