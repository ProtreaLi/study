// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*作业：
*/
contract Task1 {

    uint[] public data;

    //优化以下函数，至少节省 15% gas:
    function process(uint[] memory values) public {
        delete data;
        for(uint i = 0; i < values.length; i++) {
            if(values[i] >10) {
                data.push(values[i]);
            }
        }
    //提示：使用 calldata、缓存 length、减少 storage 操作
    }

    //优化后
    function process_new(uint[] calldata values) public {
        delete data;
        uint len = values.length;
    
        // 第一轮：统计符合条件的数量
        uint count = 0;
        for(uint i = 0; i < len; i++) {
            if(values[i] > 10) count++;
        }
        
        if(count == 0) return;
        
        // 在 memory 中构建完整的数组
        uint oldLen = data.length;
        uint[] memory temp = new uint[](oldLen + count);
        
        // 复制原有数据到 memory
        for(uint i = 0; i < oldLen; i++) {
            temp[i] = data[i];
        }
        
        // 添加新数据到 memory
        uint idx = oldLen;
        for(uint i = 0; i < len; i++) {
            if(values[i] > 10) {
                temp[idx++] = values[i];
            }
        }
        
        data = temp;
    }
}