pragma solidity ^0.4.24;

contract SafeMath {

    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a, "overflow");
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a, "overflow");
        c = a - b;
    }

    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b, "overflow");
    }
    
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0, "overflow");
        c = a / b;
    }
}