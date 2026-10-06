`timescale 1ns/1ps

module comparator_tb();

  localparam int N=4;
  
  logic [N-1:0] A;
  logic [N-1:0] B;
  logic         Greater;
  logic         Equal;
  logic         Lesser;
  
  comparator dut(A,B,Greater,Equal,Lesser);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,comparator_tb);
  end
  
  initial begin
    
    for(int a=0;a<4;a++)begin
      for(int b=0;b<4;b++)begin
        
        A = a;
        B = b;
        
        #1;
        
        if(Greater!== (A>B))
          $error("Greater Fail : A=%b B=%b",A,B);
        if(Lesser!==(A<B))
          $error("Lesser Fail : A=%b B=%b",A,B);
        if(Equal !== (A==B))
          $error("Equal Fail : A=%b B=%b",A,B);
        
      end
    end
    $finish;
  end
  
endmodule
    
    
  
