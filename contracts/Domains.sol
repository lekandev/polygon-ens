// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract Domains {
  // A "mapping" data type to store their names
  mapping(string => address) public domains;

  // Checkout our new mapping! This will store values
  mapping(string => string) public records;

  constructor() {
    console.log("THIS IS MY DOMAINS CONTRACT. NICE.");
  }

  // A register function that adds their names to our mapping
  function register(string calldata name) public {
    // Check that the name is unregistered (explained in notes)
    require(domains[name] == address(0));
    domains[name] = msg.sender;
    console.log("%s has registered a domain!", msg.sender);
  }

  // This will give us the domain owners' address
  function getAddress(string calldata name) public view returns (address) {
    return domains[name];
  }

  function setRecord(string calldata name, string calldata record) public {
    // Check that the owner is the transaction sender
    require(domains[name] == msg.sender);
    records[name] = record;
  }

  function getRecord(string calldata name) public view returns(string memory) {
    return records[name];
  }
}