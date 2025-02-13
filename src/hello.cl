class Main  {
    io : IO <- new IO;
    x : String <- "Hello world\n";

    main(): Bool {
        {
            io.out_string(x);
            true; 
        }
    };
};