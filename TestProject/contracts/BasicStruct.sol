// SPDX-License-Identifier: MIT 

pragma solidity ^0.6.0;

contract StudentInformation{
    
    //initialize a struct
    struct Student{
        string name;
        uint   matricNumber;
        string program;
    }
    
    //instantiating a struct
    Student s;
    
    /*first method -> the procedural way
    add a student into a struct
    I made a basic struct declaration is called 's'
    the individual struct properties like name, matricNumber, program can be accessed
    using s.name, s.matricNumber and s.program
    */
    function addStudent(string memory _name, uint _matNo, string memory _program) public {
        s.name = _name;
        s.matricNumber = _matNo;
        s.program = _program;
    }
    /*
    second mmethod -> readable/shorter way
    adding a student into a struct by using the Struct object
    s = Student(_name, _matNo, _program);
    add the _name, _matNo, and _program into the struct
    */
    function addStudent2(string memory _name, uint _matNo, string memory _program) public {
       s = Student(_name, _matNo, _program);
    }
    
    //retrive the data from the struct
    function retriveStudent() public view returns (string memory, uint, string memory){
        return (s.name, s.matricNumber, s.program);
    }
    
}
