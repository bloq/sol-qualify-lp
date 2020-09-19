
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import './interfaces/IQualifyLP.sol';
import './interfaces/Balancer.sol';
import './interfaces/IUniswapV2Pair.sol';

contract QualifyLP is IQualifyLP {
    mapping(address => uint256) private lps;

    constructor() public {
    }

    function qualified(address lpToken) external override view returns(uint256) {
        return lps[lpToken];
    }
}
