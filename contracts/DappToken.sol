pragma solidity ^0.4.2;

contract DappToken {
    //Constructor
    //Set the total number of tokens
    //Read the total number of tokens
    //Name
    string public name = "SIKU Token";
    string public symbol = "SIKU";
    string public standard = "SIKU Token v1.0";

    uint256 public totalSupply;
    mapping (address => uint256) public balance0f;

    function DappToken(uint256 _initialSupply) public{
        balance0f[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }


}