var SupplyChainWorker = artifacts.require("./DEB.sol");

module.exports = function(deployer) {
        deployer.deploy(SupplyChainWorker);
};