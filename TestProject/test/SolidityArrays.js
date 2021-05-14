//declare the contract artifact
const SolidityArrays = artifacts.require("SolidityArrays");

contract('SolidityArrays', ()=>{
  let SolidityArraysInstance = null;

  before(async ()=>{
  SolidityArraysInstance = await SolidityArrays.deployed();
  });

  //first test
  it('it should add an element to the ids array', async () =>{
    //get an instance of the SolidityArrays
    //const SolidityArraysInstance = await SolidityArrays.deployed();
    //add an element to the ids array
    await SolidityArraysInstance.add(10);
    //0 is the first index
    //const result = SolidityArraysInstance.ids(0);
    const result = await SolidityArraysInstance.ids(0);
    assert(result.toNumber() == 10);
  });
  //second test
  it('it should retrieve an element from the ids array', async () =>{
    //get an instance of the SolidityArrays
    //const SolidityArraysInstance = await SolidityArrays.deployed();
    //add an element to the ids array
    await SolidityArraysInstance.add(20);

    const result = await SolidityArraysInstance.get(1);
    assert(result.toNumber() == 20);
  });

  //third test
  it('it should return the elements of the ids array', async () =>{
    //get an instance of the SolidityArrays
    //const SolidityArraysInstance = await SolidityArrays.deployed();
    const rawIds = await SolidityArraysInstance.getAll();
    const ids = rawIds.map(id => id.toNumber());
    assert.deepEqual(ids, [10,20]);
  });

  //fourth test
  it('should return the length of the array', async () =>{
    //const SolidityArraysInstance = await SolidityArrays.deployed();
    const length = await SolidityArraysInstance.getLength();
    assert(length.toNumber() == 2);
  });

});
