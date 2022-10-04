// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Whitelist {
    // max no. of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // if: whitelisted => true
    mapping(address => bool) public whitelistedAddresses;

    // no. of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    // setting max no. of whitelisted addresses
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        // if: numAddressesWhitelisted > maxWhitelistedAddresses => error
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );
        // add address which called the fn. to the array
        whitelistedAddresses[msg.sender] = true;
        // increment the numAddressesWhitelisted
        numAddressesWhitelisted += 1;
    }
}
