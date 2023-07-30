// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

// Following https://soliditydeveloper.com/ecrecover
contract Ecrecover {
    function recoverSignerFromSignature(
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes32 hash
    ) external {
        address signer = ecrecover(hash, v, r, s);
        require(signer != address(0), "ECDSA: invalid signature");
    }
}
