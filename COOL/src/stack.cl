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
   console : Console <- new Console;

   head : Node <- new Node; -- we initialize the List with both a head as a "ghost" Node
   size : Int <- 1;

   oldHead : Node;
   swapNode: Node;

   nodeToSwapA: Node;
   nodeToSwapB: Node;



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
               head.setAsHead(false); -- former head no longer is set as head
               oldHead <- head; 
               head <- newNode.init(value).setAsHead(true); -- new Node is now the head

               head.setNext(oldHead); 

               size <- size + 1; 
            }
        ); 
        self;
      }
   };


   -- swap() : Bool {
   --    {
   --       nodeToSwapA <- node;
   --       nodeToSwapB <- node.getNext();


   --       nodeToSwapA.setNext(swapNode);

   --       swapNode.setNext(nodeToSwapB.getNext());

   --       nodeToSwapB.setNext(nodeToSwapA);
   --       nodeToSwapA.setNext(swapNode.getNext());

   --      true;
   --    }
   -- };

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

   print() : Bool {
      {
         (let nodeToPrint : Node <- head in 
            {
               while (not nodeToPrint.isTail()) loop {
                  console.log(nodeToPrint.getValue());
                  nodeToPrint <- nodeToPrint.getNext(); 
               } pool;                    
            }
         );
      true; 
      } 
   };


   -- evaluate() : Bool {
   --    {
   --       if (head.getValue() = "s") then
   --          {
   --             -- head.setAsHead(false);
   --             -- head.nextNode().setAsHead(true);
   --             -- head.setNext(trashNode);
   --             swap(head);
   --          } 
   --             else if (head.getValue() = "+") then
   --          {
   --             console.log("+");
   --          }                   
   --             else
   --          {
   --             console.log(">");
   --          }
   --          fi fi;
   --       true;
   --    }
     
   -- };
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

   list : List <- new List;

   main() : Bool {
      {
         list.init();
         (let continue : Bool <- true in 
            {
               while continue loop {
                  input <- console.enter();

                  if input = "x" then
                     {
                        continue <- false;
                     } 
                  else if input = "d" then
                     {
                        list.print();
                     }
                  else if input = "s" then
                     {
                        console.log("s");
                     }                     
                  else
                     {
                        list.push(input);
                     }
                  fi fi fi;
               } pool; 
            }
         );
      true; 
      } 
   };
};
