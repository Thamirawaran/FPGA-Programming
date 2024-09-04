`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 01:24:55 AM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input clk,
    input rst,
    input reg [1:0] sel,
    output reg [3:0] count
    );
    reg dir = 1'b0;
// sel == 2'd0 => Zero
// sel == 2'd1 => Up counter
// sel == 2'd2 => Down counter
// sel == 2'd3 => Updown counter

    reg [27:0] temp;
    reg clk_div;
    
    always@(posedge clk) begin
        if(rst) begin
            temp <= 0;
            clk_div <= 0;
        end
        else begin
            temp <= temp + 28'd1;
            clk_div <= temp[27];
        end
    end

    always@(posedge clk_div) begin
        if (count == 4'b0000)
        dir <= 1'b0; // up counter
        else if (count == 4'b1111) begin
            dir <= 1'b1; //down counter
        end
    end
    
    always@(posedge clk_div) begin
        if(rst) count <= 4'd0;
        else if (sel == 2'd0) begin
            count <= 4'd0;
        end
        else if (sel == 2'd0) begin
            count <= count + 4'd1;
        end
        else if (sel == 2'd0) begin
            count <= count - 4'd1;
        end
        else if (sel == 2'd0) begin
            if (dir == 1'b0)
            count <= count + 4'd1;
            else if(dir ==1'b1)
            count <= count - 4'd1;
        end
        else count <= count + 4'd1;
    end
    
endmodule
