
module tb_bcd_time_counter;

    logic clk;
    logic rst_n;
    logic tick;

    logic [3:0] seconds_ones;
    logic [3:0] seconds_tens;
    logic [3:0] minutes_ones;
    logic [3:0] minutes_tens;
    logic [3:0] hours_ones;
    logic [3:0] hours_tens;

    integer total_seconds;
    integer i;
    integer pass_count;
    integer fail_count;

    integer exp_hours;
    integer exp_minutes;
    integer exp_seconds;

    logic [3:0] exp_hours_ones;
    logic [3:0] exp_hours_tens;
    logic [3:0] exp_minutes_ones;
    logic [3:0] exp_minutes_tens;
    logic [3:0] exp_seconds_ones;
    logic [3:0] exp_seconds_tens;

    bcd_time_counter DUT (
        .clk          (clk),
        .rst_n        (rst_n),
        .tick         (tick),

        .seconds_ones (seconds_ones),
        .seconds_tens (seconds_tens),

        .minutes_ones (minutes_ones),
        .minutes_tens (minutes_tens),

        .hours_ones   (hours_ones),
        .hours_tens   (hours_tens)
    );

    // 10 ns clock period
    initial clk = 1'b0;
    always #5 clk = ~clk;


    // Apply one second tick and check the counter
    task automatic apply_tick;

        begin
            @(negedge clk);
            tick = 1'b1;

            @(posedge clk);
            #1;

            // Update independent reference model
            total_seconds = total_seconds + 1;

            if (total_seconds == 86400)
                total_seconds = 0;

            // Convert reference time into HH:MM:SS
            exp_hours   = total_seconds / 3600;
            exp_minutes = (total_seconds % 3600) / 60;
            exp_seconds = total_seconds % 60;

            exp_hours_tens   = exp_hours / 10;
            exp_hours_ones   = exp_hours % 10;

            exp_minutes_tens = exp_minutes / 10;
            exp_minutes_ones = exp_minutes % 10;

            exp_seconds_tens = exp_seconds / 10;
            exp_seconds_ones = exp_seconds % 10;

            // Compare DUT against reference model
            if ({
                hours_tens, hours_ones,
                minutes_tens, minutes_ones,
                seconds_tens, seconds_ones
            } === {
                exp_hours_tens, exp_hours_ones,
                exp_minutes_tens, exp_minutes_ones,
                exp_seconds_tens, exp_seconds_ones
            }) begin
                pass_count = pass_count + 1;
            end
            else begin
                fail_count = fail_count + 1;

                $display(
                    "FAIL: Expected %0d%0d:%0d%0d:%0d%0d",
                    exp_hours_tens, exp_hours_ones,
                    exp_minutes_tens, exp_minutes_ones,
                    exp_seconds_tens, exp_seconds_ones
                );

                $display(
                    "      Actual   %0d%0d:%0d%0d:%0d%0d",
                    hours_tens, hours_ones,
                    minutes_tens, minutes_ones,
                    seconds_tens, seconds_ones
                );
            end

            tick = 1'b0;
        end

    endtask


    initial begin

        rst_n        = 1'b0;
        tick         = 1'b0;
        total_seconds = 0;

        pass_count = 0;
        fail_count = 0;

        // Apply reset
        repeat (2) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        // Check that tick=0 holds the time
        repeat (3) begin
            @(posedge clk);
            #1;

            if ({
                hours_tens, hours_ones,
                minutes_tens, minutes_ones,
                seconds_tens, seconds_ones
            } === 24'h000000)
                pass_count = pass_count + 1;
            else begin
                fail_count = fail_count + 1;
                $display("FAIL: Counter changed while tick=0");
            end
        end

        // Count one complete day plus one extra second
        for (i = 0; i < 86401; i = i + 1)
            apply_tick();

        $display("----------------------------------");
        $display("Total checks : %0d", pass_count + fail_count);
        $display("PASS         : %0d", pass_count);
        $display("FAIL         : %0d", fail_count);
        $display("----------------------------------");

        if (fail_count == 0)
            $display("TEST PASSED");
        else
            $display("TEST FAILED");

        $finish;

    end

endmodule
