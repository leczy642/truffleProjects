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
const abi = [{"inputs":[{"internalType":"uint256","name":"_value","type":"uint256"}],"name":"setValue","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getValue","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"}];
const address = '0xC9dfB23a6f01aC0c4C8800D04DeDa83414e5B044';

const contract = new web3.eth.Contract(abi, address);
//test the contract
//console.log(contract);

//interact with the contract methods
contract.methods.getValue().call((err, result) => {
  console.log(`Value : ${result}`);
});

//grab the first account in the blockchain
async function getCurrentAccount() {
  const accounts = await web3.eth.getAccounts();
  return accounts[0];
}


contract.methods.setValue(4).send({from : '0x5643543b76Dd17aa7236858154FC134f5aaE079c'});

//setValue();
  //contract.methods.setValue(2).send({from : account});
