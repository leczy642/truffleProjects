const SimpleStorage = artifacts.require("SimpleStorage");

const initialVal = {
  val:10
};
module.exports= function (deployer) {
  deployer.deploy(SimpleStorage, initialVal.val);
};
