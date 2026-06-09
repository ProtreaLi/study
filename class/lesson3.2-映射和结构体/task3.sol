Q1：为什么mapping不能遍历？
    mapping不存储key值

Q2:如何实现可遍历的mapping
    用数组将key存起来，遍历数组的key，再用mapping取出每个key的value

Q3：struct中包含mapping有什么限制？
    1.不能直接作为函数参数或返回值，apping 是引用类型，不直接赋值或传递（除非是 storage 引用）。
    2.不能作为 public 结构体字段自动生成 getter，自动 getter 只支持基本类型、定长数组等。
    3.赋值时需要小心，两个 struct 变量（包含 mapping）不能直接整体赋值（除非是 storage 到 storage 引用）。

Q4:mapping +struct组合的优势是什么？
    结构清晰，查找快，灵活扩展