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

##**Program 4: Bubble Sort Test**

Below is the full **assembly code**, its **hexadecimal encoding**, and the **remarks** explaining each instruction’s purpose.  
This program sorts an array stored in memory using the **Bubble Sort algorithm**.

| Assembly Instruction | Hex | Comment / Remark |
|----------------------|------|------------------|
| `addi R12, R0, 8` | `00080305` | Store number of elements minus one |
| `addi R1, R0, 0` | `00000045` | Initialize loop index `i` to 0 |
| `addi R1, R1, 1` | `00010845` | Increment index `i` after each iteration |
| `blt R12, R1, end` | `000164d2` | Exit when `i` reaches the last element |
| `addi R2, R12, 0` | `00006085` | Initialize inner loop counter with number of elements |
| `beq R1, R2, loop1` | `ffe20f10` | If inner loop counter equals `i`, restart outer loop |
| `addi R15, R0, 1` | `000103c5` | Load 1 into R15 (for subtraction) |
| `sub R2, R2, R15` | `00af1080` | Decrement inner loop counter |
| `sll R5, R2, R15` | `000f1140` | Compute address offset within the “array” |
| `sub R4, R5, R15` | `00af2900` | Prepare address for next memory element |
| `addi R11, R0, 0` | `000002c5` | Initialize temporary register R11 to 0 |
| `add R5, R5, R11` | `008b2940` | Compute base memory address for R5 |
| `add R4, R4, R11` | `008b2100` | Compute next memory address for R4 |
| `lw R6, 0(R5)` | `0000298e` | Load first memory element into R6 |
| `lw R7, 0(R4)` | `000021ce` | Load next memory element into R7 |
| `blt R7, R6, loop2` | `ffe63d52` | If R7 < R6, skip swapping |
| `sw R6, 0(R4)` | `0006200f` | Store first element into the second location |
| `sw R7, 0(R5)` | `0007280f` | Store second element into the first location |
| `jalr R0, R0, loop2` | `0006000d` | Jump back to inner loop to continue sorting |
| `end:` | — | End of program |

The corresponding `.hex` file (`SortingTest.hex`) can be loaded into ROM for automated execution.

---

This project is open-source for educational purposes under the MIT License.
