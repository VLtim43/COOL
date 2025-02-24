-- implements a "node" that holds a string value
class Node inherits IO {
   value : String <- "_";
   nextNode : Node;

   isHead : Bool <- false;
   isTail : Bool <- false;

   isNul : Bool <- true;

   init(val: String): Node {
     {
      value <- val;
      isNul <- false;
      self;
     }
   };   


   setAsHead(arg: Bool): Node {
      {
         isHead <- arg;
         self;
      }
   };

   setAsTail(arg: Bool): Node {
      {
         isTail <- arg;
         self;
      }
   };

   isHead() : Bool {
      {
         isHead;
      }
   };

   isTail() : Bool {
      {
         isTail;
      }
   };

   isNul() : Bool {
      {
         isNul;
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

 

   setNext(node: Node): Node {
      {
         nextNode <- node;
         nextNode;
      }
   };
};

-- implements a "list" that is an array of strings
class List {
   head : Node <- new Node; -- we initialize the List with both a head as a "ghost" Node
   size : Int <- 1;

   oldHead : Node;

   init() : List {
      {
         head.setAsHead(true);
         head.setAsTail(true);
         self;
      }

   };


   push(value: String) : List {
      {
        (let newNode : Node <- new Node  in
            {  
               head.setAsHead(false);
               oldHead <- head;
               head <- newNode.init(value).setAsHead(true);

               head.setNext(oldHead);

               size <- size + 1;
            }
        ); 
        self;
      }
   };



   getHead() : Node {
      {
         head;
      }
   };

   getSize() : Int {
      {
         size;
      }
   };


};


-- implements a console wrapper for IO methods
class Console inherits IO {

   log(arg: String) : Object {
      {
         out_string(arg.concat("\n"));
      }
   };

   logInt(arg: Int) : Object {
      {
         out_int(arg);
         out_string("\n");
      }
   };

   logBool(arg : Bool) : Object {
      {
         if (arg = true) then
	         out_string("true".concat("\n"))
	      else
	         out_string("false".concat("\n"))
	      fi;
      }        

   };

   enter() : String {
      {
         out_string(">");
         in_string();
      }
   };
   
};


-- main
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

   list : List <- new List;

   main() : Bool {
      {  
         
         list.init();
         list.push("1").push("2").push("3").push("4").push("5");


         -- console.logInt(list.getSize());

         true;
      }
   };

};
