# qualify-lp

## Summary

Perform simple ABI checks, to determine if an address seems to behave
like a Uniswap or Balancer LP pool token.

## Using

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

Ethereum mainnet deployment: [0xeE87996440515154fb913Fada7aBB4F2Caecb14f](https://etherscan.io/address/0xee87996440515154fb913fada7abb4f2caecb14f)

