
// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0;

interface IQualifyLP {
    function qualified(address lpToken) external view returns(uint256);
    function qualifyUniswapLP(address lpToken, address token0, address token1) external returns (bool);
    function qualifyBalancerLP(address lpToken) external returns (bool);
}
