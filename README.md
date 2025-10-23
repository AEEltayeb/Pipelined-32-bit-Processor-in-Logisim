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
1- Instruction Test (Test_Instructions.asm):
Purpose: Comprehensive verification of all major instruction types (R-Type, I-Type, Memory, and Branch) including addi, slli, sub, mul, lw, sw, and all conditional branches (beq, blt, bgeu, etc.). Ensures the ALU, Register File, and Control Unit execute instructions correctly.

2- Bit Counter (Counterfor11.asm):
Purpose: Implements a Population Count (counting the number of '1' bits in a register). This test focuses on validating the correct execution of Shift (sra), Logical (andi), and Branch (beq, bne) instructions within a structured loop, exercising the Control Unit and Next PC logic.

3- Loop and Hazard Test (Test_Loop&Hazard.asm):
Purpose: Calculates a simple summation in a loop, deliberately creating a classic RAW (Read After Write) Data Hazard between consecutive addi and add instructions. This is the critical test for verifying the operational integrity of the Hazard Detection and Forwarding Unit.

4- Sorting Test (SortingTest.asm):
Purpose: Implements the Bubble Sort algorithm. This test subjects the processor to a high-stress, real-world scenario involving nested loops, intensive Memory Access (lw, sw), and frequent Conditional Branching. It serves as a final evaluation of overall pipeline performance and stability under heavy data and control flow pressure.

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
