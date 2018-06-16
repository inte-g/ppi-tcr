pragma solidity ^0.4.11;

// These are useless imports, but they force these contracts to be compiled. We need their build
// files for the test pipeline.
import "tokens/eip20/EIP20.sol";
import "plcr-revival/PLCRFactory.sol";

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}