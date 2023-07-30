// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

// See https://soliditydeveloper.com/ecrecover
// and https://github.com/ethereumbook/ethereumbook/blob/develop/06transactions.asciidoc#how-digital-signatures-work
// (r,s) is the signature. 
// v is used to uniquely recover the signer's address (from 2 possible choices)
//    see https://github.com/ethereumbook/ethereumbook/blob/develop/06transactions.asciidoc#the-signature-prefix-value-v-and-public-key-recovery
contract Ecrecover {
    function recoverSignerFromSignature(
        uint8 v,
        bytes32 r,
        bytes32 s,
        bytes32 hash
    ) external pure {
        address signer = ecrecover(hash, v, r, s);
        require(signer != address(0), "ECDSA: invalid signature");
    }
}
