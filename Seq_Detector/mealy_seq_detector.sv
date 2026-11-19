module mealy_seq_detector(
  input logic clk,
  input logic rst_n,
  input logic din,
  
  output logic detect
);
  
  typedef enum logic[1:0]{
    S0 = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10,
    S3 = 2'b11
  } state;

  state curr_state,next_state;
  
  //state-regesiter
  always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)
      curr_state <= S0;
    else
      curr_state = next_state;
  end
  
  //next_state logic and output
  always_comb begin
    next_state = curr_state;
    detect     = 1'b0;
    case(curr_state)
      S0:begin
        if(din)
          next_state = S1;
        else
          next_state = S0;
      end
      S1:begin
        if(din)
          next_state = S1;
        else
          next_state = S2;
      end
      S2:begin
        if(din)
          next_state = S3;
        else
          next_state = S0;
      end
      S3:begin
        if(din)begin
        	detect = 1'b1;
          	next_state = S1;
        end
        else
          next_state = S2;
      end
      default:begin
        next_state = S0;
        detect = 1'b0;
      end
    endcase
  end
        
endmodule
