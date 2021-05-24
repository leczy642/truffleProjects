// SPDX-License-Identifier: MIT 

pragma solidity ^0.6.0;

contract StudentInformation{
    
    //declare a struct
    struct Student{
        string name;
        uint   matricNumber;
        string program;
    }
    
    Student s;
    
    //declare a mapping
    mapping(uint => Student) studentInfo;
    
    function addStudent(string memory _name, uint _matNo, string memory _program) public {
        s.name = _name;
        s.matricNumber = _matNo;
        s.program = _program;
    }
    
    function addStudent2(string memory _name, uint _matNo, string memory _program) public {
       s = Student(_name, _matNo, _program);
    }
    
    function retriveStudent() public view returns (string memory, uint, string memory){
        return (s.name, s.matricNumber, s.program);
    }
    
}
