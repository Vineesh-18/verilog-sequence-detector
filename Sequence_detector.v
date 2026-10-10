module Sequence_detector(
    input clock, reset, data_in,
    output reg sequence_detected
);
parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

reg [2:0] state;
reg [2:0] next_state;

always @(posedge clock or posedge reset)
    begin
        if(reset)
          begin 
            state <= S0;
          end
        else 
            state <= next_state;  
    end  

always @(*)
            begin 
                next_state = S0;
                if(state == S4)
                    sequence_detected = 1'b1;
                else
                    sequence_detected = 1'b0;
                case(state)
                    S0: begin
                        if(data_in)
                            next_state = S1;
                        else
                            next_state = S0;
                    end
                    S1: begin
                        if(data_in)
                            next_state = S1;
                        else
                            next_state = S2;
                    end
                    S2: begin
                        if(data_in)
                            next_state = S3;
                        else
                            next_state = S0;
                    end
                    S3: begin
                        if(data_in)
                          begin  next_state = S4;
                      
                          end
                        else
                            begin 
                            next_state = S2;
                        
                            end
                    end
                    S4: begin
                        if(data_in)
                            begin
                                next_state = S1;
                
                            end
                        else
                          begin
                            next_state = S2;
                      
                          end
                    end
                endcase
            end
endmodule