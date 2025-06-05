module sync_ram (
    input wire clk,
    input wire we,
    input wire [3:0] addr,
    input wire [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] mem [0:15];  // 16 locations of 8-bit each
    integer i;             // <-- Move declaration OUTSIDE initial block

    // Initialize memory and output to 0
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            mem[i] = 8'b0;
        end
        dout = 8'b0;
    end

    // Synchronous read and write
    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;

        dout <= mem[addr];
    end

endmodule



//Testbench code
module tb_sync_ram;

    reg clk;
    reg we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Instantiate the RAM
    sync_ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize signals
        we = 0; addr = 0; din = 0;

        // Wait for some time
        #10;

        // Write 0xA5 at address 4
        we = 1; addr = 4'd4; din = 8'hA5; #10;

        // Write 0x3C at address 8
        addr = 4'd8; din = 8'h3C; #10;

        // Disable write to read
        we = 0;

        // Read from address 4
        addr = 4'd4; #10;

        // Read from address 8
        addr = 4'd8; #10;

        // Wait and finish
        #20;
        $finish;
    end

endmodule

