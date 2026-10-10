module tb;
    reg clock, reset, data_in;
    wire sequence_detected;
    Sequence_detector uut(
        .clock(clock),
        .reset(reset),
        .data_in(data_in),
        .sequence_detected(sequence_detected)
    );


initial
    begin
           $display("Simulation started");
       clock = 0;
        forever #5 clock = ~clock;
    end
    
    
initial 
    begin
       $monitor("Time=%0t | clk=%b | reset=%b | data=%b | state=%b | detected=%b",
         $time, clock, reset, data_in, uut.state, sequence_detected);
        reset = 1;
        data_in = 0;
        #10 reset = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;    
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
         
        #10 $finish;
        
    end

endmodule