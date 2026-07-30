# 🚀 5-Stage Pipelined RV32I Processor

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Architecture](https://img.shields.io/badge/RISC--V-RV32I-green)
![Pipeline](https://img.shields.io/badge/Pipeline-5%20Stage-orange)
![Verification](https://img.shields.io/badge/Verification-GTKWave-red)
![Synthesis](https://img.shields.io/badge/Synthesis-Yosys-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

A **32-bit 5-stage pipelined RISC-V (RV32I) processor** designed and implemented in **Verilog HDL**. The processor supports the base RV32I instruction set and incorporates **hazard detection**, **data forwarding**, and **branch handling** for efficient pipelined execution.

The design has been **functionally verified using Icarus Verilog**, analyzed through **GTKWave waveform visualization**, synthesized using **Yosys**, and examined using **Xilinx Vivado RTL Analysis**.

---

## ✨ Features

- 32-bit RV32I Processor
- Classic 5-Stage Pipeline
- Instruction Fetch (IF)
- Instruction Decode (ID)
- Execute (EX)
- Memory Access (MEM)
- Write Back (WB)
- Hazard Detection Unit
- Data Forwarding Unit
- Branch & Jump Support
- Immediate Generator
- ALU Control Unit
- Register File
- Separate Instruction and Data Memory
- Pipeline Registers
- Verilog Testbench
- Functional Simulation using Icarus Verilog
- Waveform Debugging using GTKWave
- RTL Elaboration using Xilinx Vivado
- Logic Synthesis using Yosys

---

# 🏗 Pipeline Architecture

```
                +----------------+
                | Instruction IF |
                +----------------+
                        │
                  IF/ID Register
                        │
                +----------------+
                | Instruction ID |
                +----------------+
                        │
                  ID/EX Register
                        │
                +----------------+
                | Execute (EX)   |
                +----------------+
                        │
                 EX/MEM Register
                        │
                +----------------+
                | Memory (MEM)   |
                +----------------+
                        │
                 MEM/WB Register
                        │
                +----------------+
                | Write Back WB  |
                +----------------+
```

---

# 📂 Repository Structure

```
5-Stage-Pipelined-RV32I-Processor/
│
├── rtl/
├── testbench/
├── simulation/
├── synthesis/
├── images/
├── docs/
├── README.md
├── LICENSE
├── .gitignore
└── program.mem
```

---

# ⚙️ Pipeline Stages

### Instruction Fetch (IF)

- Program Counter
- Instruction Memory
- PC + 4 Generator
- Next PC Logic

### Instruction Decode (ID)

- Instruction Decoder
- Register File
- Immediate Generator
- Control Unit

### Execute (EX)

- Arithmetic Logic Unit (ALU)
- ALU Control
- Forwarding Unit
- Branch Comparator
- Branch Target Adder

### Memory Access (MEM)

- Data Memory
- Memory Read
- Memory Write

### Write Back (WB)

- Write Back Multiplexer
- Register File Update

---

# ⚠️ Hazard Handling

## Data Hazards

Implemented using:

- Forwarding Unit
- Hazard Detection Unit

The forwarding unit resolves RAW hazards whenever possible without introducing pipeline stalls.

Load-use hazards are detected by the Hazard Detection Unit, which inserts the required stall to preserve correct execution.

---

# 🌿 Branch Handling

Supported control-flow instructions:

- BEQ
- BNE
- BLT
- BGE
- JAL
- JALR

Branch decisions are computed in the Execute stage using the Branch Comparator and Branch Target Adder.

---

# 📋 Supported RV32I Instructions

### R-Type

- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT
- SLTU

### I-Type

- ADDI
- ANDI
- ORI
- XORI
- SLLI
- SRLI
- SRAI
- SLTI
- SLTIU
- LW
- JALR

### S-Type

- SW

### B-Type

- BEQ
- BNE
- BLT
- BGE

### U-Type

- LUI
- AUIPC

### J-Type

- JAL

---

# 🧪 Functional Verification

The processor was verified using a custom Verilog testbench.

### Verification Flow

```
Verilog RTL
      │
      ▼
Icarus Verilog
      │
      ▼
VCD Waveform
      │
      ▼
GTKWave
```

Waveforms generated during simulation were analyzed using **GTKWave** to verify:

- Correct Program Counter updates
- Pipeline execution
- Register File operations
- ALU functionality
- Memory read/write operations
- Data forwarding
- Hazard detection
- Branch execution
- Write-back functionality

---

# 🛠 Tools Used

| Tool | Purpose |
|------|----------|
| Verilog HDL | Hardware Description |
| Icarus Verilog | Functional Simulation |
| GTKWave | Waveform Visualization & Debugging |
| Yosys | Logic Synthesis |
| Xilinx Vivado | RTL Elaboration & Design Analysis |
| Git & GitHub | Version Control |

---

# 📸 Results

## RTL Schematic

> *(Insert Vivado RTL/Elaborated Design screenshot here.)*

---

## GTKWave Simulation

> *(Insert GTKWave waveform screenshot here.)*

Waveforms were analyzed to validate the correct operation of all five pipeline stages, hazard detection, forwarding logic, branch execution, and memory operations.

---

## Yosys Synthesis

> *(Insert Yosys synthesis report or screenshot here.)*

---

# 🚀 Future Improvements

- AI-Enhanced RV32I Processor
- Custom AI Instruction Extension
- Fixed-Point Arithmetic Engine
- Logistic Regression Hardware Inference
- FPGA Implementation
- ASIC Implementation using OpenLane & Sky130

---

# 📚 References

- RISC-V Unprivileged ISA Specification
- Computer Organization and Design – Patterson & Hennessy
- Yosys Open Synthesis Suite
- Icarus Verilog
- GTKWave
- Xilinx Vivado

---

# 👨‍💻 Author

**Daksh Maheshwari**

B.Tech, Electronics & Communication Engineering  
Birla Institute of Technology, Mesra

---

## ⭐ Support

If you found this project helpful, consider giving it a **⭐ Star** on GitHub.
