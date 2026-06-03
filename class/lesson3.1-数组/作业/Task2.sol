// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*作业：
*/
contract Task1 {

    uint[] public data;

    //优化以下函数，至少节省 15% gas:
    function process(uint[] memory values) public {
        for(uint i = 0; i < values.length; i++) {
            if(values[i] >10) {
                data.push(values[i]);
            }
        }
    //提示：使用 calldata、缓存 length、减少 storage 操作
    }

    //优化后
    function process_new(uint[] calldata values) public {
        uint[] memory temp ;
        uint len = values.length;
        uint count = 0;
        for(uint i = 0; i < len; i++) {
            if(values[i] >10) {
                count++;
            }
        }
        uint oldLen = data.length;
        data.length = oldLen + count;

        // for(uint i = 0; i < len; i++) {
        //     if(values[i] > 10) {
        //         data[oldLen++] = values[i];
        //     }
        // }
    }
}