// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Strings.sol";

//作业：
//3.编写代码测试Solidity0.8版本前后整数溢出的行为
contract Task1 {
 
   using Strings for uint256;
   uint256 public a = 666;
   string public b = "888";

    //作业1:值类型基本使用
    function homework1_basic_use_value() public view returns (uint256) {
        uint256 result = a + 100;  // 加法操作
        return result;
    }
    //作业1:引用类型基本使用
    function homework1_basic_use_ref() public view returns (string memory){
        // string拼接操作
        string memory newString = string(abi.encodePacked(b, "hello"));
        return newString;
    }

    //作业1:uint256 转 string
    function a2b() public {
        a = 666;
        b = a.toString(); 
    }

    //作业1:string 转 uint256
    function b2a() public {
        b = "888";
        a = stringToUint(b);
    }

    //作业1:辅助函数：string 转 uint256
    function stringToUint(string memory s)   internal  pure returns (uint256) {
        bytes memory k = bytes(s);
        uint256 result = 0;
        for(uint i = 0; i < k.length; i++) {
            uint8 char = uint8(k[i]);
            require(char >= 48 && char <= 57, "Invalid character");
            result = result * 10 + (char - 48);
        }
        return result;
    }

}