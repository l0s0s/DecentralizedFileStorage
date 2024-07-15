// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedStorage {
    struct File {
        string cid;
        string name;
        uint256 timestamp;
    }

    mapping(address => File[]) public files;

    function addFile(string memory _cid, string memory _name) public {
        File memory newFile = File({
            cid: _cid,
            name: _name,
            timestamp: block.timestamp
        });

        files[msg.sender].push(newFile);
    }

    function getFiles(address _owner) public view returns (File[] memory) {
        return files[_owner];
    }
}
