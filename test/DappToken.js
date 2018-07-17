var DappToken = artifacts.require("./DappToken.sol");

contract ('DappToken', function(accounts){

    it('Sets the total Supply upon Deployment', function(){
        return DappToken.deployed().then(function (instance) {
          tokenInstance = instance;
          return tokenInstance.totalSupply();  
        }).then(function(totalSupply){
            assert.equal(totalSupply.toNumber(),1000000,'sets the total supply to 1,000,000');
        })
    });

});