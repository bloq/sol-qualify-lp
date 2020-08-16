
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.6;

import '@openzeppelin/contracts/access/AccessControl.sol';
import './interfaces/IAddressList.sol';

contract AddressList is AccessControl, IAddressList {
    mapping(address => uint) private theList;
    bytes32 public constant LIST_ADMIN = keccak256("LIST_ADMIN");

    constructor() public {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
	_setupRole(LIST_ADMIN, msg.sender);
    }

    function in_list(address a) external view override returns (bool) {
        return (theList[a] != 0x0);
    }

    function add(address a) external override returns (bool) {
        require(hasRole(LIST_ADMIN, msg.sender));
	return _add(a);
    }

    function remove(address a) external override returns (bool) {
        require(hasRole(LIST_ADMIN, msg.sender));
	return _remove(a);
    }

    function _add(address a) private returns (bool) {
        if (theList[a] == 0x0) {
	    emit AddressAdded(a, msg.sender);
	    theList[a] = 0x1;
	    return true;
	}

	return false;
    }

    function _remove(address a) private returns (bool) {
        if (theList[a] != 0x0) {
	    emit AddressRemoved(a, msg.sender);
	    delete theList[a];
	    return true;
	}

	return false;
    }
}
