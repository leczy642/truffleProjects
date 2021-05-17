//useful links
//https://solidity-by-example.org/sending-ether/
//https://solidity-by-example.org/fallback/
//https://web3js.readthedocs.io/en/v1.2.0/web3-eth.html#sendtransaction

//import the web3 library
const Web3 = require('web3');

//set the RPC provider URL
const providerURL = 'http://127.0.0.1:7545';

//connect to the web3 library
const web3 = new Web3(providerURL);

//this is a check to see if we are successfully connected to the blockchain
/*web3.eth.getBlock('latest', (err, result) =>{
console.log(result);
});*/

//interact with the contract
//enter ABI and contract address
const abi = [{"inputs":[],"name":"sendEther","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"address payable","name":"_to","type":"address"}],"name":"sendEthViaCall","outputs":[],"stateMutability":"payable","type":"function"},{"stateMutability":"payable","type":"fallback"},{"stateMutability":"payable","type":"receive"},{"inputs":[],"name":"functionCalled","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getEthBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"}];
const address = '0x82FAef9677ECc240bc128089B7CBAe8390bbcFd3';

const contract = new web3.eth.Contract(abi, address);
//test the contract
//console.log(contract);

//interact with the contract methods

//grab the first account in the blockchain
async function getCurrentAccount() {
  const accounts = await web3.eth.getAccounts();
  return accounts[0];
}

//add a value to the blockchain
/*async function addValue(num){
  const account = await getCurrentAccount();
  //console.log(account);
  //grab the setValue function declared in the smart contract
  await contract.methods.setValue(num).send({from : account});
}*/

//Method 1 : this function sends ether directly to our smart Contract
//using a function declared inside the smart contract
async function sendEtherium(){
  const account = await getCurrentAccount();
  //console.log(account);
  //grab the sendEther function declared in the smart contract
  await contract.methods.sendEther().send({from : account,
  value : '1000'});

  console.log(await contract.methods.functionCalled().call());
}
//retrieving values from the block chain
/*async function retrieveValue(){
const result = await contract.methods.getValue().call();
console.log(result);
}*/

async function getEtherBalance(){
  const result = await contract.methods.getEthBalance().call();
  console.log(result);
}

//sending eth directly to a smart contract without calling a function
//declared inside the smart Contract
//useful links
//https://web3js.readthedocs.io/en/v1.2.0/web3-eth.html#sendtransaction
//'contract.options.address' returns that address of our smart contract
async function sendEtherDir(){
  const account = await getCurrentAccount();
  await web3.eth.sendTransaction({
    from: account,
    to: contract.options.address,
    value: '1000'
  });
}

//this function sends ether directly to an address
//the function is the same as above just that we will
//change the to : value from contract.options.address
//to an actual address
async function sendEtherDir2Addr(){
  const account = await getCurrentAccount();
  await web3.eth.sendTransaction({
    from: account,
    to: '0x4ccB0F626A340Dbb3d1c16a94AEE0D84330289C3',
    value: '1000'
  });
}

//uncomment the function you want to run

//sendEtherDir2Addr();
//sendEtherDir();
sendEtherium();
getEtherBalance();
//addValue(25);
//retrieveValue();
  //contract.methods.setValue(2).send({from : account});
