pragma solidity ^0.4.2;

contract DappToken {
    //Constructor
    //Set the total number of tokens
    //Read the total number of tokens
    //Name
    string public name = "SIKU Token";
    string public symbol = "SIKU";
    string public standard = "SIKU Token v1.0";

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );


    uint256 public totalSupply;
    mapping (address => uint256) public balance0f;
    mapping(address => mapping(address => uint256)) public allowance;

    function DappToken(uint256 _initialSupply) public{
        balance0f[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    //Transfer Event
    function transfer(address _to, uint256 _value) public returns (bool success) {
        
        require(balance0f[msg.sender] >= _value); 
        balance0f[msg.sender] -= _value;
        balance0f[_to] += _value;

        Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balance0f[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balance0f[_from] -= _value;
        balance0f[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        Transfer(_from, _to, _value);

        return true;
    }



}