module sync_fifo #(
    parameter int DATA_W = 8,
    parameter int DEPTH  = 8,
    parameter int PTR_W  = $clog2(DEPTH),
    parameter int CNT_W  = $clog2(DEPTH + 1)
) (
    input  logic              clk,
    input  logic              rst_n,

    input  logic              wr_en,
    input  logic [DATA_W-1:0] din,

    input  logic              rd_en,
    output logic [DATA_W-1:0] dout,

    output logic              full,
    output logic              empty
);

    logic [DATA_W-1:0] mem [0:DEPTH-1];

    logic [PTR_W-1:0] wr_ptr;
    logic [PTR_W-1:0] rd_ptr;
    logic [CNT_W-1:0] count;

    logic wr_fire;
    logic rd_fire;

    assign full  = (count == DEPTH);
    assign empty = (count == 0);

    assign wr_fire = wr_en && !full;
    assign rd_fire = rd_en && !empty;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= '0;
            rd_ptr <= '0;
            count  <= '0;
            dout   <= '0;
        end else begin

            if (wr_fire) begin
                mem[wr_ptr] <= din;

                if (wr_ptr == DEPTH-1)
                    wr_ptr <= '0;
                else
                    wr_ptr <= wr_ptr + 1'b1;
            end

            if (rd_fire) begin
                dout <= mem[rd_ptr];

                if (rd_ptr == DEPTH-1)
                    rd_ptr <= '0;
                else
                    rd_ptr <= rd_ptr + 1'b1;
            end

            case ({wr_fire, rd_fire})
                2'b10: count <= count + 1'b1;
                2'b01: count <= count - 1'b1;
                default: count <= count;
            endcase
        end
    end

endmodule
