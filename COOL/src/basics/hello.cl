class Main  {
    io : IO <- new IO;
    x : String <- "Hello world\n";
    y : String;
    
    main(): Bool {
        {
            io.out_string(x);
            true; 
        }
    };
};