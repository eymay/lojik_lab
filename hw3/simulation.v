`timescale 1ns / 1ps

module CharDecoder_t();

    reg [7:0] char;
    wire [25:0] decodedChar;
    
    CharDecoder test(.char(char),.decodedChar(decodedChar));
    
    initial begin
    char = "A"; #10;
    char = "B"; #10;
    char = "C"; #10;
    char = "D"; #10;
    char = "E"; #10;
    char = "F"; #10;
    char = "G"; #10;
    char = "H"; #10;
    char = "I"; #10;
    char = "J"; #10;
    char = "K"; #10;
    char = "L"; #10;
    char = "M"; #10;
    char = "N"; #10;
    char = "O"; #10;
    char = "P"; #10;
    char = "Q"; #10;
    char = "R"; #10;
    char = "S"; #10;
    char = "T"; #10;
    char = "U"; #10;
    char = "V"; #10;
    char = "W"; #10;
    char = "X"; #10;
    char = "Y"; #10;
    char = "Z"; #10;
    $finish;
        
   end
 endmodule
 
 
 module CharEncoder_t();
 
    reg [25:0] decodedChar;
    wire [7:0] char;
    
    CharEncoder test(.decodedChar(decodedChar),.char(char));
    
    initial begin
        decodedChar = 26'h0000001; #10;
        decodedChar = 26'h0000002; #10;
        decodedChar = 26'h0000004; #10;
        decodedChar = 26'h0000008; #10;
        decodedChar = 26'h0000010; #10;
        decodedChar = 26'h0000020; #10;
        decodedChar = 26'h0000040; #10;
        decodedChar = 26'h0000080; #10;
        decodedChar = 26'h0000100; #10;
        decodedChar = 26'h0000200; #10;
        decodedChar = 26'h0000400; #10;
        decodedChar = 26'h0000800; #10;
        decodedChar = 26'h0001000; #10;
        decodedChar = 26'h0002000; #10;
        decodedChar = 26'h0004000; #10;
        decodedChar = 26'h0008000; #10;
        decodedChar = 26'h0010000; #10;
        decodedChar = 26'h0020000; #10;
        decodedChar = 26'h0040000; #10;
        decodedChar = 26'h0080000; #10;
        decodedChar = 26'h0100000; #10;
        decodedChar = 26'h0200000; #10;
        decodedChar = 26'h0400000; #10;
        decodedChar = 26'h0800000; #10;
        decodedChar = 26'h1000000; #10;
        decodedChar = 26'h2000000; #10;
       
    $finish;
    end
endmodule    


module CircularLeftShift_test();
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    
    CircularLeftShift test(.data(data),.shiftAmount(shiftAmount),.out(out));
    
    initial begin
    data = 26'h0000001; shiftAmount = 5'b00001; #10;
    data = 26'h0000002; shiftAmount = 5'b00010; #10;
    data = 26'h0000004; shiftAmount = 5'b00011; #10;
    data = 26'h0000008; shiftAmount = 5'b00100; #10;
    data = 26'h0000010; shiftAmount = 5'b00101; #10;
    data = 26'h0000020; shiftAmount = 5'b00110; #10;
    data = 26'h0000040; shiftAmount = 5'b00111; #10;
    data = 26'h0000080; shiftAmount = 5'b01000; #10;
    data = 26'h0000100; shiftAmount = 5'b01001; #10;
    data = 26'h0000200; shiftAmount = 5'b01010; #10;
    data = 26'h0000400; shiftAmount = 5'b10000; #10;
    
    $finish;
    end
endmodule    


module CircularRightShift_test();
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    
    CircularRightShift test(.data(data),.shiftAmount(shiftAmount),.out(out));
    
    initial begin
    data = 26'h0000001; shiftAmount = 5'b00001; #10;
    data = 26'h0000001; shiftAmount = 5'b00010; #10;
    data = 26'h0000002; shiftAmount = 5'b00010; #10;
    data = 26'h0000002; shiftAmount = 5'b01010; #10;
    data = 26'h0000005; shiftAmount = 5'b00011; #10;
    data = 26'h0000009; shiftAmount = 5'b00100; #10;
    data = 26'h0000010; shiftAmount = 5'b00101; #10;
    data = 26'h0000021; shiftAmount = 5'b00110; #10;
    data = 26'h0000040; shiftAmount = 5'b00111; #10;
    data = 26'h0010080; shiftAmount = 5'b01000; #10;
    data = 26'h0000105; shiftAmount = 5'b01001; #10;
    data = 26'h0000200; shiftAmount = 5'b01010; #10;
    data = 26'h0000400; shiftAmount = 5'b10000; #10;
    
    $finish;
    end
endmodule
 
module rotorTest();
    reg [25:0] forwardInput;
    reg [25:0] backwardInput;
    reg [4:0] startPosition;
    reg load;
    reg clockIn;
    wire clockOut;
    wire [25:0] forwardOutput;
    wire [25:0] backwardOutput;


    Rotor2 rotor(.forwardInput(forwardInput),.backwardInput(backwardInput),.startPosition(startPosition),.load(load),.clockIn(clockIn),.clockOut(clockOut),.forwardOutput(forwardOutput),.backwardOutput(backwardOutput));

    always #1 clockIn= ~clockIn;

    initial begin
        clockIn = 1'b0;
        startPosition = 0;
        forwardInput = 26'h0000002; #10;
        load =1;
        #2 load = 0;
        #40;
        $finish;
    end

endmodule


module CaesarEncryptionTest();

    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] cipherChar;
    
 CaesarEncryption test(.plainChar(plainChar),.shiftCount(shiftCount),.cipherChar(cipherChar)); 
   
    initial begin
    plainChar = "A"; shiftCount = 5'b00011; #10;
    plainChar = "F"; shiftCount = 5'b00011; #10;
    plainChar = "X"; shiftCount = 5'b00011; #10;
    
    $finish;
    end

endmodule    


module CaesarDecryptionTest();

    reg [7:0] cipherChar;
    reg [4:0] shiftCount;
    wire [7:0] decryptedChar;
    
 CaesarDecryption test(.cipherChar(cipherChar),.shiftCount(shiftCount),.decryptedChar(decryptedChar)); 
   
    initial begin
    cipherChar = "A"; shiftCount = 5'b00011; #10;
    cipherChar = "F"; shiftCount = 5'b00011; #10;
    cipherChar = "G"; shiftCount = 5'b00011; #10;
    
    $finish;
    end

endmodule  


module CaesarEnvironmentTest();

    reg [7:0] plainChar;   
    reg [4:0] shiftCount;   
    wire[7:0] cipherChar; 
    wire [7:0] decryptedChar;
    
  CaesarEnvironment test(.plainChar(plainChar),.shiftCount(shiftCount),.cipherChar(cipherChar),.decryptedChar(decryptedChar)); 
   
   initial begin
      plainChar = "A"; shiftCount = 5'b00011; #10;
      plainChar = "B"; shiftCount = 5'b00011; #10;
      plainChar = "C"; shiftCount = 5'b00011; #10;
      plainChar = "D"; shiftCount = 5'b00011; #10;
      
      $finish;
      end
   
endmodule    

module VigenereEncryptiontTest();

    reg [7:0] plainChar; 
    reg [79:0] keyInput; 
    reg load;          
    reg clock;           
    wire [7:0] cipherChar;
    
  VigenereEncryption test(.plainChar(plainChar),.keyInput(keyInput),.load(load),.clock(clock),.cipherChar(cipherChar)); 
    
    always #5 clock = ~clock; 
    always #5 load =  ~load;
        initial begin
        keyInput = "KADIROZLEM"; ; load = 1;clock = 0;plainChar = "I";  #10;
        plainChar = "S"; #10;
        plainChar = "T"; #10;
        plainChar = "A"; #10;
        plainChar = "N"; #10;
        plainChar = "B"; #10;
        plainChar = "U"; #10;
        plainChar = "L"; #10;
        plainChar = "T"; #10;
        plainChar = "E"; #10;
        plainChar = "C"; #10;
        plainChar = "H"; #10;
        plainChar = "N"; #10;
        plainChar = "I"; #10;
        plainChar = "C"; #10;
        
        
        $finish;
        end 
endmodule

module VigenereDecryptionTest();

    reg [7:0] cipherChar;   
    reg [79:0] keyInput;    
    reg load;               
    reg clock;            
    wire [7:0] decryptedChar;
    
    VigenereDecryption test(.cipherChar(cipherChar),.keyInput(keyInput),.load(load),.clock(clock),.decryptedChar(decryptedChar));
    
        always #5 clock = ~clock; 
        always #5 load =  ~load;
            initial begin
            keyInput = "KADIROZLEM"; ; load = 1;clock = 0; cipherChar = "S";  #10;
            cipherChar = "S"; #10;
            cipherChar = "W"; #10;
            cipherChar = "I"; #10;
            cipherChar = "E"; #10;
            cipherChar = "P"; #10;
            cipherChar = "T"; #10;
            cipherChar = "W"; #10;
            cipherChar = "X"; #10;
            cipherChar = "Q"; #10;
            cipherChar = "M"; #10;
            cipherChar = "H"; #10;
            cipherChar = "Q"; #10;
            cipherChar = "Q"; #10;
            cipherChar = "T"; #10;  
    
    $finish;
    end
endmodule  


module VigenereEnvironmentTest();

    reg [7:0] plainChar; 
    reg [79:0] keyInput; 
    reg load;          
    reg clock;           
    wire [7:0] cipherChar;
    wire [7:0] decryptedChar;
    
  VigenereEnvironment test(.plainChar(plainChar),.keyInput(keyInput),.load(load),.clock(clock),.cipherChar(cipherChar),.decryptedChar(decryptedChar)); 
    
    always #5 clock = ~clock; 
    always #5 load =  ~load;
        initial begin
        keyInput = "KADIROZLEM"; ; load = 1;clock = 0;plainChar = "I";  #10;
        plainChar = "S"; #10;
        plainChar = "T"; #10;
        plainChar = "A"; #10;
        plainChar = "N"; #10;
        plainChar = "B"; #10;
        plainChar = "U"; #10;
        plainChar = "L"; #10;
        plainChar = "T"; #10;
        plainChar = "E"; #10;
        plainChar = "C"; #10;
        plainChar = "H"; #10;
        plainChar = "N"; #10;
        plainChar = "I"; #10;
        plainChar = "C"; #10;
        
        
        $finish;
        end 
endmodule  


module EnigmaMachineTest();

           
    reg [7:0] char;         
    reg [4:0] startPosition1;
    reg [4:0] startPosition2;
    reg [4:0] startPosition3;
    reg load;               
    reg clock;              
    wire [7:0] outChar;
    
    always #5 clock = ~clock; 
    initial begin
    load = 1; clock = 0; #5;
    char="A"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; load = 0; #10;
    char="B"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
    char="C"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
    char="D"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
    char="E"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
    char="F"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
    char="G"; startPosition1=5'b00000; startPosition2=5'b00000;startPosition3=5'b00000; #10;
 
    
   
    $finish;
    end      
 
 endmodule