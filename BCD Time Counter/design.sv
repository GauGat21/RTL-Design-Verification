
module bcd_time_counter (
    input  logic clk,
    input  logic rst_n,
    input  logic tick,

    output logic [3:0] seconds_ones,
    output logic [3:0] seconds_tens,

    output logic [3:0] minutes_ones,
    output logic [3:0] minutes_tens,

    output logic [3:0] hours_ones,
    output logic [3:0] hours_tens
);

    always_ff @(posedge clk or negedge rst_n) begin

        if (!rst_n) begin
            seconds_ones <= 4'd0;
            seconds_tens <= 4'd0;

            minutes_ones <= 4'd0;
            minutes_tens <= 4'd0;

            hours_ones   <= 4'd0;
            hours_tens   <= 4'd0;
        end

        else if (tick) begin

            // Seconds counter: 00 to 59
            if (seconds_ones == 4'd9) begin
                seconds_ones <= 4'd0;

                if (seconds_tens == 4'd5) begin
                    seconds_tens <= 4'd0;

                    // Minutes counter: 00 to 59
                    if (minutes_ones == 4'd9) begin
                        minutes_ones <= 4'd0;

                        if (minutes_tens == 4'd5) begin
                            minutes_tens <= 4'd0;

                            // Hours counter: 00 to 23
                            if (hours_tens == 4'd2 &&
                                hours_ones == 4'd3) begin

                                hours_tens <= 4'd0;
                                hours_ones <= 4'd0;

                            end
                            else if (hours_ones == 4'd9) begin
                                hours_ones <= 4'd0;
                                hours_tens <= hours_tens + 4'd1;
                            end
                            else begin
                                hours_ones <= hours_ones + 4'd1;
                            end

                        end
                        else begin
                            minutes_tens <= minutes_tens + 4'd1;
                        end

                    end
                    else begin
                        minutes_ones <= minutes_ones + 4'd1;
                    end

                end
                else begin
                    seconds_tens <= seconds_tens + 4'd1;
                end

            end
            else begin
                seconds_ones <= seconds_ones + 4'd1;
            end

        end
    end

endmodule
