const Interface = artifacts.require("Interface");

module.exports = function (deployer) {
  deployer.deploy(Interface);
};
