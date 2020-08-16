# address-list

This is a simple list of admin-controlled addresses.

The primary use is for creating on-chain filter-include lists (whitelists)
and filter-exclude lists (blacklists).

This uses the OpenZeppelin Role-Based Access Control (RBAC) security,
enabling the delegation of list maintenance by the contract owner.

An AddressListFactory is provided, to enable anyone to easily create
their own AddressList for their own purposes.

