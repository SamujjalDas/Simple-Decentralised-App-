pragma solidity ^0.4.18;
contract owned{
    address owner;
    constructor() public{
        owner=msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
        
    }
    
}

contract Courses is owned{
    struct Instructor{
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    
    
    mapping(address=> Instructor) instructors;
    address[] public instructorAccs;
    
    event instructorInfo(
        bytes16 fName,
        bytes16 lName,
        uint age
        );
        
    
    
    function setInfo(address _address, uint _age, bytes16 _fName, bytes16 _lName)onlyOwner public{
        
        
        instructors[_address].age=_age;
        instructors[_address].fName=_fName;
        instructors[_address].lName=_lName;
        instructorAccs.push(_address) -1;
        emit instructorInfo(_fName,_lName,_age);
        
    }
    
    function getInfo() view public returns(address[]) {
        return instructorAccs;
    }
    
    function getInfo(address _address) view public returns (uint, bytes16, bytes16) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }
    
    function countInfo() view public returns (uint) {
        return instructorAccs.length;
    }
    
}