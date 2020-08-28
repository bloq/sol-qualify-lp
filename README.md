# address-list

## Summary

This is a simple list of admin-controlled addresses.

## Overview

The primary use is for creating on-chain filtering lists.  A key
motivation was mirroring the off-chain [Token
Lists](https://uniswap.org/blog/token-lists/) with similar on-chain
infrastructure.

Anybody may create and administer their own token list ("AddressList"),
using a provided factory contract.

Beyond the usual whitelist filtering, on-chain token lists can be used
to publish personal token lists, a list of all tokens in the Compound,
Synthetix or Yearn universe, and more.

## Features

* Fast
* O(1) queries, addition and removal
* Admin-specified value associated with each address (must not be zero)
* Role-based access control (RBAC), to separate list admin duties
  from list owner.

## Administration

Token lists are administered by a list administrator, so delegated 
to the `LIST_ADMIN` role.  This is initially the contract owner - the
Ethereum account that called the factory contract.

See the [OpenZeppelin RBAC documentation](https://docs.openzeppelin.com/contracts/3.x/access-control#role-based-access-control) for further information
about administering roles.

