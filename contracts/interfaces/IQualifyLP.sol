
// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0;

interface IQualifyLP {
    function qualified(address lpToken) external view returns(uint256);
}
