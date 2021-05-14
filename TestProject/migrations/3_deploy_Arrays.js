const SolidityArrays = artifacts.require("SolidityArrays");


module.exports= function (deployer) {
  deployer.deploy(SolidityArrays);
};
