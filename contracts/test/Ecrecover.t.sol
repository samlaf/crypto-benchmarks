// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "../src/Ecrecover.sol";

contract EcrecoverTest is Test {
    Ecrecover public ecrecoverContract;

    function setUp() public {
        ecrecoverContract = new Ecrecover();
    }

    function testSignatureVerification() public view {
        string memory _msg = "hello world";
        bytes32 msgHash = keccak256(abi.encodePacked(_msg));
        uint256 privateKey = 0x1234567890123456789012345678901234567890123456789012345678901234;
        uint8 v;
        bytes32 r;
        bytes32 s;
        (v, r, s) = signMessage(msgHash, privateKey);
        // TODO: maybe we should return a boolean, or address, and verify correctness here?
        ecrecoverContract.recoverSignerFromSignature(v, r, s, msgHash);
    }

    function signMessage(
        bytes32 msgHash,
        uint256 privateKey
    ) private pure returns (uint8 v, bytes32 r, bytes32 s) {
        // r and s are the outputs of the ECDSA signature
        // r,s and v are packed into the signature. It should be 65 bytes: 32 + 32 + 1
        (v, r, s) = vm.sign(privateKey, msgHash);
    }
}
