var DappToken = artifacts.require("./DappToken.sol");

contract ('DappToken', function(accounts){
    it('initializes the contract with the correct values', function(){
        return DappToken.deployed().then(function (instance){
            tokenInstance = instance;
            return tokenInstance.name();
        }).then(function(name){
            assert.equal (name, 'SIKU Token','has the correct name');
            return tokenInstance.symbol();
        }).then(function(symbol){
            assert.equal(symbol,'SIKU','has the correct Symbol');
        });
    });
    it('allocate the initial Supply upon Deployment', function(){
        return DappToken.deployed().then(function (instance) {
          tokenInstance = instance;
          return tokenInstance.totalSupply();  
        }).then(function(totalSupply){
            assert.equal(totalSupply.toNumber(),1000000,'sets the total supply to 1,000,000');
            return tokenInstance.balance0f(accounts[0]);
        }).then(function(adminBalance){
             assert.equal(adminBalance.toNumber(),1000000,'it allocates the initial supply to the admin account');
        });
    });

});