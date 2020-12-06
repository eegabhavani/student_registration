//SPDX-License-Identifier: MIT
pragma solidity ^0.4.17;

contract studentRegister {  
    address private owner;
      
   function  studentRegister() public{
        owner = msg.sender;
    }
    mapping (uint=>student)public students;
    
    struct student{
        string name ;
        uint rollNo;
        uint maths;
        uint physics;
        uint chemistry;
        uint totalMarks;
        uint average;
        bool isExist;
    }
 
    function setMarks(uint rollNo,string memory _name,uint _maths,uint _physics,uint _chemistry)public
    {
        require(students[rollNo].isExist==false);
           
        students[rollNo].name =  _name; 
        students[rollNo].maths= _maths; 
        students[rollNo].physics= _physics;
        students[rollNo].chemistry= _chemistry;
        students[rollNo].totalMarks=(students[rollNo].maths+students[rollNo].physics+students[rollNo].chemistry);
        students[rollNo].average=(students[rollNo].totalMarks)/3;
       
    }
    function getMarksOfPerticularStudent(uint rollNo)public view returns(string memory,uint,uint,uint)
    {
         return(students[rollNo].name,rollNo,students[rollNo].totalMarks,students[rollNo].average);
    }
  
}
