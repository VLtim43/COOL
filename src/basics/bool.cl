class Main  {
    io : IO <- new IO;
    x : String <- "Hello world\n";
    
    main(): Object {
      {
       if x = "banana" then
	        io.out_string("is even!\n")
	     else
	        io.out_string("is odd!\n")
	     fi;
        
      }
    };
};