# address-list

## Summary

This is a simple list of admin-controlled addresses.

## Overview

The primary use is for creating on-chain filter-include lists (whitelists)
and filter-exclude lists (blacklists).

This uses the OpenZeppelin Role-Based Access Control (RBAC) security,
enabling the delegation of list maintenance by the contract owner.

An AddressListFactory is provided, to enable anyone to easily create
their own AddressList for their own purposes.

## Features

* Fast
* O(1) queries, addition and removal
* Admin-specified value associated with each address (must not be zero)
* Role-based access control (RBAC), to separate list admin duties
  from list owner.
