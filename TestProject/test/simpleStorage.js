//declare the contract artifact
const SimpleStorage = artifacts.require("SimpleStorage");


contract('SimpleStorage', () => {
  it("should deploy the smart contract properly", async() => {
    //declare the smart contract instance
    const simpleStorageInstance = await SimpleStorage.deployed();
    console.log(simpleStorageInstance.address);
    assert(simpleStorageInstance.address != '');
  });

  it("can only accept a number", async() => {
    const simpleStorageInstance = await SimpleStorage.deployed();
    await simpleStorageInstance.setValue(10);
    const result = await simpleStorageInstance.getValue();
    console.log(result);
    //assert(result == 10);
    assert.equal(result.valueOf(), 10, "enter value of 10");
  });
});
