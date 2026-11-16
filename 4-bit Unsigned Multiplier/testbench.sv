module tb_multiplier();
  logic [3:0]A;
  logic [3:0]B;
  
  logic [7:0]PRODUCT;
  
  logic [7:0]expected;
  
  integer i,j,pass_count,fail_count;
  
  multiplier_4bit dut(
    .A(A),
    .B(B),
    .PRODUCT(PRODUCT)
  );
  
  initial begin	
    
    pass_count = 0;
    fail_count = 0;
    
    for(i=0;i<16;i=i+1)begin
      for(j=0;j<16;j=j+1)begin

        A = i;
        B = j;

        #3

        expected = {4'b0000,A}*{4'b0000,B};
        
        if (PRODUCT === expected) begin
          pass_count = pass_count + 1;
        end
        else begin
          fail_count = fail_count + 1;

          $display(
            "FAIL: A=%0d B=%0d",
            A, B
          );

          $display(
            "Expected=%b Actual=%b",
            expected, PRODUCT
          );


        end
      end
    end	
    $display("--------------------------------");
    $display("Total tests : %0d", pass_count + fail_count);
    $display("PASS        : %0d", pass_count);
    $display("FAIL        : %0d", fail_count);
    $display("--------------------------------");

    if (fail_count == 0)
      $display("4-BIT MULTIPLIER TEST PASSED");
    else
      $fatal(1, "4-BIT MULTIPLIER TEST FAILED");

    $finish;
    
  end
 
endmodule
