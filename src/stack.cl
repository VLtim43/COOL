class Node inherits IO {
   value : String <- "_";
   nextNode : Node;

   init(val: String): Node {
     {
      value <- val;
      nextNode <- new Node; 
      self;
     }
   };   


   getValue() : String {
      {
         value;
      }
   };

   getNext() : Node {
      {
         nextNode;
      }
   };
};


class List {
   head : Node;

   init() : Node {
      
   }


}



class Console inherits IO {

   log(arg: String) : Object {
      {
         out_string(arg.concat("\n"));
      }
   };

   enter() : String {
      {
         out_string(">");
         in_string();
      }
   };
   
};

class Main {
   
   console : Console <- new Console;
   input : String;

   -- main() : Bool {
   --    {
   --       (let continue : Bool <- true in 
   --          {
   --             while continue loop {
   --                input <- console.enter();

   --                if input = "x" then
   --                   {
   --                      console.log("[END_OF_PROGRAM]");
   --                      continue <- false;
   --                   } 
   --                else
   --                   console.log("KEEP")
   --                fi;
   --             } pool; 
   --          }
   --       );
   --    true; 
   --    } 
   -- };

   node : Node <- new Node;

   main() : Bool {
      {
       
         true;
      }
   };

};
