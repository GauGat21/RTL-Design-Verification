module moore_seq_detector(
  input logic clk,
  input logic rst_n,
  input logic din,
  
  output logic detect
);
  
  typedef enum logic [2:0]{
    S0 = 3'b00,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100
  } state;

  state curr_state,next_state;
  
  //state-regesiter
  always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)
      curr_state <= S0;
    else
      curr_state = next_state;
  end
  
  //next_state logic
  always_comb begin
    next_state = curr_state;
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
          	next_state = S4;
        end
        else
          next_state = S2;
      end
      S4:begin
        if(din)
          next_state = S1;
        else
          next_state = S2;
      end
      default:next_state = S0;
    endcase 
  end
  // Moore output logic
  always_comb begin
    detect = (curr_state == S4);
  end

        
endmodule
