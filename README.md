# Task2-RAM-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS 

*NAME*: Sujal Chavan

*INTERN ID*: CT04DF1863

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTOSH


# Description of the Task

In this task, I designed and simulated a synchronous Random Access Memory (RAM) module using Verilog hardware description language. The RAM module implemented is a simple memory block with 16 addressable locations, each capable of storing 8 bits of data. The design incorporates synchronous write and synchronous read operations controlled by a clock signal, a write enable signal, an address bus, and data input/output ports.

The primary objective was to create a memory module that can store data reliably and allow data retrieval based on a specified address, all synchronized to the clock. Synchronous memory modules are widely used in digital systems as they ensure data stability and predictability by changing state only on clock edges, which is crucial for timing accuracy in complex designs.

Design Details:

The sync_ram module contains a 16x8-bit memory array declared as reg [7:0] mem [0:15]. The inputs include a clock (clk), a write enable (we), a 4-bit address bus (addr), and an 8-bit data input (din). The output is an 8-bit data output (dout). Inside the module, on every rising edge of the clock, the module checks the write enable signal. If we is high, the data on din is written to the memory location specified by addr. Simultaneously, the content of the memory at the given address is read and assigned to dout, making both write and read operations synchronous to the clock.

An initial block is used to initialize all memory locations and the output register to zero, ensuring a known starting state for simulation.

Testbench and Simulation:

To verify the design, a testbench tb_sync_ram was created. The testbench generates a clock signal with a period of 10 time units and applies various test vectors to the RAM. Initially, the write enable is deactivated, and all inputs are reset. Then, two write operations are performed sequentially: writing 8'hA5 to address 4, and 8'h3C to address 8. After these writes, the write enable is disabled to allow reading from the memory. The data at address 4 and address 8 are read back and observed on the output.

The simulation results confirmed that the RAM module correctly stored and retrieved data. When writing to a location, the data was correctly latched into the specified memory address. During read operations, the data output reflected the expected values previously written. This demonstrates that both write and read mechanisms work synchronously with the clock and handle data reliably.

Discussion of Results and Behavior:

The synchronous nature of the design ensures predictable timing behavior, as all read and write operations occur on the clock's rising edge. This prevents race conditions and glitches common in asynchronous designs. However, one notable aspect is the read-after-write behavior at the same clock cycle. Since the output dout is assigned after the memory write, reading the address being written in the same clock cycle yields the old data, not the new input. This behavior is typical in many FPGA RAM primitives and can be modified depending on system requirements.

Moreover, initializing memory content at simulation start helps prevent undefined or unknown values, which is critical for verifying digital designs. In real hardware, initialization might need to be done via reset or configuration memory.

Conclusion:

The task successfully implemented a fundamental synchronous RAM module suitable for digital systems requiring controlled memory storage with predictable timing. The testbench verified that the RAM operates correctly, storing and retrieving data as intended. This exercise reinforces the understanding of synchronous design principles, memory modeling in Verilog, and basic testbench creation for functional verification. Such a memory module can serve as a building block for larger systems like processors, caches, or buffers in digital designs.



# OUTPUT

![Image](https://github.com/user-attachments/assets/b0e1f55a-f107-4a70-9320-9ca03412806b)

![Image](https://github.com/user-attachments/assets/4c7adfd0-b947-4741-8ebc-29231107abe3)
