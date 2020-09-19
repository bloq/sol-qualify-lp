
// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

import './interfaces/IQualifyLP.sol';
import './interfaces/Balancer.sol';
import './interfaces/IUniswapV2Pair.sol';

contract QualifyLP is IQualifyLP {
    mapping(address => uint256) private lps;
    uint256 constant LP_UNISWAP = 1;
    uint256 constant LP_BALANCER = 2;

    constructor() public {
    }

    function qualified(address lpToken) external override view returns(uint256) {
        return lps[lpToken];
    }

    function qualifyUniswapLP(address lpToken, address token0, address token1) external override returns (bool) {
        IUniswapV2Pair pair = IUniswapV2Pair(lpToken);

	require(pair.decimals() == 18);
	require(pair.totalSupply() > 0);
	require(token0 != token1);
	require(pair.token0() == token0 || pair.token1() == token0);
	require(pair.token0() == token1 || pair.token1() == token1);

	(uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) =
	    pair.getReserves();
	require(reserve0 > 0);
	require(reserve1 > 0);
        require(blockTimestampLast > 0);

	lps[lpToken] = LP_UNISWAP;

	return true;
    }

    function qualifyBalancerLP(address lpToken) external override returns (bool) {
	BPool bpool = BPool(lpToken);

	require(bpool.totalSupply() > 0);
	require(bpool.isPublicSwap() == true);
	require(bpool.isFinalized() == true);
	require(bpool.getNumTokens() >= 2);
	require(bpool.getSwapFee() > 0);

	lps[lpToken] = LP_BALANCER;

	return true;
    }
}
