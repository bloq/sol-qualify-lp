
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.6;

interface IAddressList {
    event AddressAdded(address indexed a, address indexed sender);
    event AddressRemoved(address indexed a, address indexed sender);

    function add(address a) external returns (bool);
    function remove(address a) external returns (bool);

    function in_list(address a) external view returns (bool);
}
