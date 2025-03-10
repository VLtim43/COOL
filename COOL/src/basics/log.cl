class Console inherits IO {
   input : String;

   log(arg: String) : Object {
      {
         out_string(arg.concat("\n"));
      }
   };

   enter() : String {
      {
         out_string(">");
         input <- in_string();
         input;
      }
   };
   
};




class Main {
   
   console : Console <- new Console;
   input : String;

   main() : Object {
      {
         input <- console.enter();
         console.log(input); 
      }
   };

};
