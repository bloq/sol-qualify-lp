# qualify-lp

## Summary

Perform simple ABI checks, to determine if an address seems to behave
like a Uniswap or Balancer LP pool token.

## Using

### Step 1 - qualify LP token

Call `qualifyUniswapLP()` or `qualifyBalancerLP()` to validate an LP token, and add it to the database.

### Step 2 - query qualifications database

Import the interface file `IQualifyLP.sol` into a solidity contract, then treat as a simple mapping:

```
    function do_something_with_lp_token(address lpToken) internal returns (bool) {
	address LPQualAddr = address(0xeE87996440515154fb913Fada7aBB4F2Caecb14f);
	IQualifyLP lpQual = IQualifyLP(LPQualAddr);
	uint256 constant LP_UNISWAP = 1;

	// check QualifyLP's mapping of validated tokens
	uint256 qualResult = lpQual.qualified(lpToken);

	// require that lpToken is a Uniswap-like pair liquidity pool contract
	// Requires someone MUST have previously called qualifyUniswapLP() at some
	// point in the past.
	require(qualResult == LP_UNISWAP);
    }
```

## Deployment

Ethereum mainnet deployment, v0.9.0: [0xeE87996440515154fb913Fada7aBB4F2Caecb14f](https://etherscan.io/address/0xee87996440515154fb913fada7abb4f2caecb14f)

## Caveats

This can only provide a minimum guarantee that the address provided _seems to behave like_ a Uniswap
or Balancer pool token.  A fork such as SushiSwap, using the same
ABI as Uniswap, will pass these qualifications.

