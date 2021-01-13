pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //The id of the Borrowers that will be used for testing
    uint expectedBorId = 8;

    //The expected owner of adopted Borrowers is this contract
    address expectedAdopter = address(this);

  function testUserCanAdoptBor() public {
    uint returnedId = adoption.adopt(expectedBorId);
    Assert.equal(returnedId, expectedBorId, "Adoption of the expected Borrowers should match what is returned.");
  }

  // Testing retrieval of a single Borrowers 
  function testGetAdopterAddressByBorId() public {
    address adopter = adoption.adopters(expectedBorId);
    Assert.equal(adopter, expectedAdopter, "Owner of the expected Borrowers should be this contract");
  }

  // Testing retrieval of all Borrowers  
  function testGetAdopterAddressByBorIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[expectedBorId], expectedAdopter, "Owner of the expected Borrowers should be this contract");
  }
}

