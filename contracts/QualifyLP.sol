
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
	// return qualification data for the specified contract address.
	// returns zero, if unknown / not-qualified.
        return lps[lpToken];
    }

    function qualifyUniswapLP(address lpToken, address token0, address token1) external override returns (bool) {
        IUniswapV2Pair pair = IUniswapV2Pair(lpToken);

	// Perform a series of simple functional tests, calling
	// as many different ABI functions as is feasible without
	// exceeding gas limits or performing complex operations that
	// require additional assets.

	// Each ABI call, and each test, increases the likelihood that
	// this contract is a Uniswap pair contract.

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

	// Tests complete.  Mark token as a Uniswap LP token contract.
	lps[lpToken] = LP_UNISWAP;

	return true;
    }

    function qualifyBalancerLP(address lpToken) external override returns (bool) {
	BPool bpool = BPool(lpToken);

	// Perform a series of simple functional tests, calling
	// as many different ABI functions as is feasible without
	// exceeding gas limits or performing complex operations that
	// require additional assets.

	// Each ABI call, and each test, increases the likelihood that
	// this contract is a (finalized+swappable) Balancer pool contract.

	require(bpool.totalSupply() > 0);
	require(bpool.isPublicSwap() == true);
	require(bpool.isFinalized() == true);
	require(bpool.getNumTokens() >= 2);
	require(bpool.getSwapFee() > 0);

	// Tests complete.  Mark token as a Balancer LP token contract.
	lps[lpToken] = LP_BALANCER;

	return true;
    }
}
