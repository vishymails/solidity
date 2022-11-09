
pragma solidity ^0.8.0;

contract Test {
   uint public x ;

   constructor() public  {
       x=100;
   }
   fallback() external payable { x=100; }    
}
contract Sink {
   fallback() external payable { }
}
contract Caller {
   function callTest(Test test) public returns (bool) {
      (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
      require(success);
      // test.x is now 1

      address payable testPayable = payable(address(test));
      // Sending ether to Test contract,
      // the transfer will fail, i.e. this returns false here.
      return testPayable.send(2 ether);
   }
   function callSink(Sink sink) public returns (bool) {
      address payable sinkPayable = payable(address(sink));
      return (sinkPayable.send(2 ether));
   }
}