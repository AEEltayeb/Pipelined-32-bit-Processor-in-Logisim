# Pipelined 32-bit Processor – Logisim Evolution

## Overview
This project implements a **32-bit pipelined processor** in **Logisim Evolution**.  
It supports a custom instruction set capable of performing arithmetic, logical, shift,
memory, and control flow operations.  

The design was created as part of the **COE301 – Computer Architecture** course @ KFUPM

---

## Features
- **Five-stage pipeline**: Instruction Fetch, Decode, Execute, Memory, Write-Back  
- **Hazard Detection and Forwarding** for pipeline conflict resolution  
- **32-bit Register File** (32 registers × 32 bits)  
- **Arithmetic Logic Unit (ALU)** supporting arithmetic, logical, shift, and comparison operations  
- **Control Unit** with ROM-based opcode decoding  
- **Next-PC logic** for branching and jumping  


---

## Processor Architecture
The processor consists of several major components:

| Component | Description |
|------------|-------------|
| **Register File** | Stores 32 general-purpose registers for instruction operands. |
| **ALU** | Executes arithmetic and logical operations. |
| **Control Unit** | Decodes instructions and generates control signals. |
| **Hazard Detector** | Detects and resolves data hazards via stalling or forwarding. |
| **Next PC Unit** | Computes jump and branch targets. |
| **Memory Units** | ROM (for program) and RAM (for data). |

---

## Requirements
- **Logisim Evolution** (latest version recommended):  
 

---

## How to Run
1. **Open Logisim Evolution**.
2. Load the provided circuit file (`PipelinedProcessor.circ`).
3. Load a program:
   - Right-click the **ROM component** → **Edit Contents** → **Load File** → Select `Program_Name.hex`.
4. Start the simulation:
   - Toggle the **Clock** to execute instructions.
5. Observe register and memory changes to verify program execution.

---

##  Test Programs
Several test programs were created to validate the design:
1. **Instruction Test** – Tests arithmetic, logic, and memory instructions.  
2. **Bit Counter** – Counts number of 1s in a binary number.  
3. **Loop and Hazard Test** – Validates hazard and forwarding units.  
4. **Sorting Test** – Implements a Bubble Sort algorithm in machine code.

### SortingTest.hex Example (Bubble Sort)

00080305
00000045
00010845
000164d2
00006085
ffe20f10
000103c5
00af1080
000f1140
00af2900
000002c5
008b2940
008b2100
0000298e
000021ce
ffe63d52
0006200f
0007280f
0006000d

Each instruction represents a hexadecimal encoding of assembly instructions used for sorting an array in memory.

This project is open-source for educational purposes under the MIT License.
