const SimpleStorage = artifacts.require("SimpleStorage");

//we initialize the value for the constructor here
const initialVal = {
  val:10
};
module.exports= function (deployer) {
  deployer.deploy(SimpleStorage, initialVal.val);
};
