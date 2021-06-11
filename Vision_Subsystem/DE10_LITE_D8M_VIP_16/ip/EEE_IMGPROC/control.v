module control(
    input clk,
    input rst_n,
    input i_pixel,
    input i_pixel_valid,
    input [21:0]  i_pixel_addr,
    output reg [8:0] o_pixel,
    output [21:0] o_pixel_addr_out
);

localparam kernel_width = 3;
localparam width = 640;
localparam height = 480;
localparam first_n_line = width;
localparam last_line = width * (height-1);

reg [18:0] pixelCounter; //Total Counter of the frame 0 - 307200 (640*480)
reg [9:0] pixelRowCounter; //Counter for pixels in a row 0 - 640
reg [10:0] pixelStartUpCounter; //Counter to allow time for set up

reg [1:0] currentWrLine; //Decides which buffer to write to

reg [3:0] line_input_valid;
wire [3:0] line_rd_data;

reg data_ready;
wire [2:0] lb0data;
wire [2:0] lb1data;
wire [2:0] lb2data;
wire [2:0] lb3data;

reg [1:0] state;

shiftreg	pixel_addr_reg (
	.aclr ( ~rst_n ),
	.clken ( i_pixel_valid ),
	.clock ( clk ),
	.shiftin ( i_pixel_addr ),
	.taps ( o_pixel_addr_out )
	);

///////////////////////////////////////////////////////////////////////
// FSM (To allow for time to store 2 rows of pixels in the Line Buffer)
localparam START_UP = 1'b0;
localparam FILTER_ON = 1'b1;
initial begin
    data_ready <= 1'b1;
    state <= START_UP;
end
always @(posedge clk)
    begin
        if (~rst_n)
            begin
                state <= START_UP;
                data_ready <= 1'b1;
                pixelStartUpCounter <= 11'd0;
            end
        else begin
            if(state == START_UP) begin
                if (pixelStartUpCounter == width * 2 - 1) 
                    begin
                        state <= FILTER_ON;
                        data_ready <= 1'b0;
                        pixelStartUpCounter <= 11'd0;
                    end
                else if (i_pixel_valid) pixelStartUpCounter <= pixelStartUpCounter + 11'd1;
            end
                    
        end
    end

///////////////////////////////////////////////////////////////////////
// Pixel Counters (Total and Row)
always @(posedge clk)
    begin
        if(~rst_n | ((pixelCounter == width * height | data_ready) & i_pixel_valid) )
            pixelCounter <= 19'd0;
        else if (i_pixel_valid)
            pixelCounter <= pixelCounter + 19'd1;
    end

always @(posedge clk)
    begin
        if( ~rst_n | (pixelRowCounter == width - 1 & i_pixel_valid)) 
            pixelRowCounter <= 10'd0;
        else if (i_pixel_valid)	
            pixelRowCounter <= pixelRowCounter + 10'd1;
    end
///////////////////////////////////////////////////////////////////////
// Writing of Line Buffers (Write to 1 out of the 4 line buffer at every one time)
always @(posedge clk)
    begin
        if(~rst_n)
            currentWrLine <= 0;
        else
        begin 
            if(pixelRowCounter == width - 1 & i_pixel_valid)
                currentWrLine <= currentWrLine+ 2'd1;
        end
    end


always @(*)
    begin
        case (currentWrLine)
            0: begin
                line_input_valid = {i_pixel_valid, 3'd0};
            end
            1: begin
                line_input_valid = {3'd0, i_pixel_valid};
            end
            2: begin
                line_input_valid = {2'd0, i_pixel_valid, 1'd0};
            end
            3: begin
                line_input_valid = {1'd0, i_pixel_valid, 2'd0};
            end
        endcase
    end

///////////////////////////////////////////////////////////////////////
// Reading of Line Buffers (Read 3 Line Buffers at one time, if the first or last row, add padding)

assign line_rd_data = (i_pixel_valid) ? ~line_input_valid : 4'd0 ;

always @(*)
    begin
        case (currentWrLine)
            // Read 0, 1, 2, Write 3
            0: begin
                if (pixelCounter <= first_n_line| pixelCounter == last_line + width) o_pixel = {3'b111, lb1data, lb2data};
                else if (pixelCounter >= last_line & pixelCounter < last_line + width) o_pixel = {lb0data, lb1data, 3'b111};
                else o_pixel = {lb0data, lb1data, lb2data};
            end
            // Read 1, 2, 3 Write 0
            1: begin
                if (pixelCounter <= first_n_line| pixelCounter == last_line + width) o_pixel = {3'b111, lb2data, lb3data};
                else if (pixelCounter >= last_line & pixelCounter < last_line + width) o_pixel = {lb1data, lb2data, 3'b111};
                else o_pixel = {lb1data, lb2data, lb3data};
            end
            // Read 2, 3, 0 Write 1
            2: begin
                if (pixelCounter <= first_n_line | pixelCounter == last_line + width) o_pixel = {3'b111, lb3data, lb0data};
                else if (pixelCounter >= last_line & pixelCounter < last_line + width) o_pixel = {lb2data, lb3data, 3'b111};
                else o_pixel = {lb2data, lb3data, lb0data};
            end
            // Read 3, 0, 1 Write 2
            3: begin
                if (pixelCounter <= first_n_line| pixelCounter == last_line + width) o_pixel = {3'b111, lb0data, lb1data};
                else if (pixelCounter >= last_line & pixelCounter < last_line + width) o_pixel = {lb3data, lb0data, 3'b111};
                else o_pixel = {lb3data, lb0data, lb1data};
            end
            
        endcase
    end

line_buffer lb0(
    .clk(clk),
    .rst_n(rst_n),
    .i_data(i_pixel),
    .i_data_valid(line_input_valid[0]),
    .i_rd_data(line_rd_data[0]),
    .o_data(lb0data)
);

line_buffer lb1(
    .clk(clk),
    .rst_n(rst_n),
    .i_data(i_pixel),
    .i_data_valid(line_input_valid[1]),
    .i_rd_data(line_rd_data[1]),
    .o_data(lb1data)
);

line_buffer lb2(
    .clk(clk),
    .rst_n(rst_n),
    .i_data(i_pixel),
    .i_data_valid(line_input_valid[2]),
    .i_rd_data(line_rd_data[2]),
    .o_data(lb2data)
);

line_buffer lb3(
    .clk(clk),
    .rst_n(rst_n),
    .i_data(i_pixel),
    .i_data_valid(line_input_valid[3]),
    .i_rd_data(line_rd_data[3]),
    .o_data(lb3data)
);

endmodule