class Console {

    io : IO <- new IO;
    
    log(arg : String) : Object {
       {
         io.out_string(arg);
       }
    };

    newLine() : Object {
        {
          io.out_string("\n");
        }

    };

    input() : String {
        {
            io.in_string();
        }
    };
 
};



class Main  {

    console : Console <- new Console;
    input : String;


    main(): Object {
        {
          console.log("What is your name?".concat("\n"));  
          input <- console.input();
          console.log("Hi".concat(" ").concat(input).concat("\n"));
        }
    };
};