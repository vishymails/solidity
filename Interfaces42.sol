/*

Interfaces are similar to abstract contracts and are created using interface keyword. Following are the key characteristics of an interface.

    Interface can not have any function with implementation.

    Functions of an interface can be only of type external.

    Interface can not have constructor.

    Interface can not have state variables.

    Interface can have enum, structs which can be accessed using interface name dot notation.

Example

Try the following code to understand how the interface works in Solidity.
*/


pragma solidity ^0.5.0;

interface Calculator {
   function getResult() external view returns(uint);
}
contract Test is Calculator {
   constructor() public {}
   function getResult() external view returns(uint){
      uint a = 1; 
      uint b = 2;
      uint result = a + b;
      return result;
   }
}
