// SPDX-License-Identifier: MIT 
//usefull links 
//https://www.tutorialspoint.com/solidity/solidity_structs.htm
//https://jeancvllr.medium.com/solidity-tutorial-all-about-structs-b3e7ca398b1e
//https://bit.ly/3um9iIR
//https://www.youtube.com/watch?v=gfXewa4xmYE&t=12s

pragma solidity ^0.6.0;

contract StudentInformation{
    
    //initialize a struct
    struct Student{
        string name;
        uint   matricNumber;
        string program;
    }
    
    //create an AddStudent event
    event AddStudent(address studentAddress, string name, uint matricNumber, string program);
    
    //instantiating a struct
    Student public s;
    
    mapping(address => Student) studentInfo;
    
    /*
    create an array to hold student address
    this is done so as to enable us get the number of students 
    in our database
    */
    address[] private studentAccounts;
    
    /*
    add a new student to the struct
    we save the values using a mapping
    example studentInfo[_stuAddress].name , saves a value in the name attribute of the studentInfo Struct
    */
    function addStudent(address _stuAddress, string memory _name, uint _matricNumber, string memory _program) public {
        studentInfo[_stuAddress].name = _name;
        studentInfo[_stuAddress].matricNumber = _matricNumber;
        studentInfo[_stuAddress].program = _program;
        
        studentAccounts.push(_stuAddress);
        
        //emit the AddStudent event
        emit AddStudent(msg.sender, _name, _matricNumber, _program);
        
     }
     
     /*retrieve a particular student from the struct thorugh their address
     returns studentInfo[_stuAddress].name, studentInfo[_stuAddress].matricNumber, studentInfo[_stuAddress].program
     which contains the name, matricNumber and program
     */
     function retrieveStudent(address _stuAddress) public view returns(string memory, uint, string memory){
         return (studentInfo[_stuAddress].name, studentInfo[_stuAddress].matricNumber, studentInfo[_stuAddress].program);
     }
     
     /*
     retrieve all the addresses stored in the studentAccounts array
     */
     function retrieveStudentAccounts() public view returns(address[] memory){
         return (studentAccounts);
     }
     
     /*retrieve  the student count 
     this is done by returning the length of the studentAccounts array
     which holds the addresses
     */
     function getStudCount() public view returns(uint){
         return (studentAccounts.length);
     }
    
    
}
