# Lab3 Path Sum
### Path Sum
從九宮格的中心點出發，給定一段路徑，請計算 路徑上的總和。

![](https://i.imgur.com/yc0TvtO.png)

舉例 : 路徑為 Down -> Right，路徑上的總和為 -1

#### 重要規定
- 在計算 路徑上的總和 時，請用 ==Adder–subtractor== 實作加總
- 依照路徑順序下，保證測資不會產生 Overflow
___
### Interface
![](https://i.imgur.com/9HOPq7n.png)

#### Input 

| Name | Width | Description |
| --- | --- | --- |
| clk | 1-bit | clock signal |
| rst | 1-bit | 用來初始化的訊號，當 rst == 1 時，系統進行 reset |
| start | 1-bit | 當 start == 1 時，系統開始進行運算|
| data | 5-bit | 從 ROM 中所讀出的資料，2's complement |

#### Output 

| Name | Width | Description |
| --- | --- | --- |
| en | 1-bit | 控制 ROM 是否 Enable，當 en 為 1 時，才能進行讀取動作|
| addr | 5-bit | 讀取 ROM 的位置 |
| fin | 1-bit | 代表運算結束。fin 拉起為 1 時，testbench 會比對 result 是否正確 |
| result | 5-bit | 路徑總和，2's complement |

![](https://i.imgur.com/GGgVBJf.png)

#### Input 
| Name | Width | Description |
| --- | --- | --- |
| a | 5-bit | a + b = sum 的 a|
| b | 5-bit | a + b = sum 的 b |
| cin | 1-bit | carry in |
#### Output 
| Name | Width | Description |
| --- | --- | --- |
| sum | 5-bit | a + b = sum 的 sum |
| cout | 1-bit | carry out |

#### <font color=red>注意：adderSubtractor 不能用'+' '-' 實作 </font>
#### <font color=red>注意：Module IO port 必須與圖中 IO port  命名一致 !!</font>

___

### Top View

以下是 TBT , TBT_tb , ROM 之間的關係圖。 
資料讀取的部分，TBT 輸出 en 與 addr 給 ROM，ROM 在 clk negative edge 時輸出 data 給 TBT。
其餘部分，clk , rst , start 的值由 TBT_tb 決定，輸出給 TBT。TBT 則輸出 fin , result 給 TBT_tb，檢查正確性。

![](https://i.imgur.com/GuzKnyr.png)

___

### ROM

介紹 ROM 中存放資料的結構。
這次 lab 使用 32 * 5 bits 大小的 ROM，也就是有 32 個儲存空間，每一個空間都是 5 bits。

如下圖所示，路徑長度在 addr = 31 的位址，路徑則是在 addr = 0 , 1 , 2 , ... 的位址。

![](https://i.imgur.com/EQLQXBv.png)


___

### Testbench 的特性

- rst 用來初始化的訊號
- start 用來啟動系統的訊號
- 在 clk negedge 給 rst / start / data
    - 我們希望你的 DFF 是在 posedge 時 trigger，所以為了保證 DFF 把 Q 的值設為 D 時，input 都已經穩定，我們統一在 negedge 給 rst / start / data。
- 承上個特性，在讀 ROM 時，就算設好了 en 和 addr，也不會立刻得到位置為 addr 的 data
- data 只在 start == 1 時給值
___

### 助教提供以下檔案
* header.v : 設定 timescale（模擬電路時，時間單位與精準度的設定），此檔案請一定要在==第一個 compile==
* synopsys_dc.setup : 使用 Design Vision 前需放入工作目錄的設定檔，相關內容請參照 Tool 教學
* TBT.v : TBT module
* TBT_tb.v : Testbench，Demo 時會以隱藏測資測試同學的電路
* info.dat : Testbench 測資
* makefile
---

### Requirements

<font color=red>請注意！！檔名請依照規定，否則不予計分!!</font>

* __TBT.v__

* 使用 Design Vision 產生 Netlist 檔
    * 請存成 __TBT_syn.v__

* 使用 Design Vision 產生的 gate delay 資訊
    * 請存成 __TBT.sdf__

---

### 繳交文件

* header.v
* TBT.v
* TBT_syn.v
* TBT.sdf
* TBT_tb.v
* info.dat
* makefile
* {StudentID}_report.pdf, ex. `107067777_report.pdf`
    * State Transition Graph ( 圖 + 原因 )
    * Block Diagram [範例](https://hackmd.io/s/Sy1nwlAcf#Block-Diagram-Datapath)
    * ncverilog 模擬結果 ( sim + syn )