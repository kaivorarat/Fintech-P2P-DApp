pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    function adopt(uint borId) public returns (uint){
        require(borId >= 0 && borId <=15);
        adopters[borId] = msg.sender;
        return borId;
    }

    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }
}