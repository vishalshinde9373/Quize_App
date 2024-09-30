import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState()=>_QuizApp();
}
class _QuizApp extends State{
  List<Map> allQuestions=[
    {
      "question":"Who is the founder of Microsoft?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":1
    },
    {
      "question":"Who is the founder of Apple?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":0
    },
    {
      "question":"Who is the founder of Google?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":3
    },
    {
      "question":"Who is the founder of SpaceX?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Lary Page"],
      "correctAnswer":2
    },
    {
      "question":"Who is the founder of Meta?",
      "options":["Steve jobs","Bill Gates","Elon Musk","Mark Zuckerburg"],
      "correctAnswer":3
    },
    ];
    int currentQuestionIndex=0;
    int selectionAnswerIndex=-1;
    int count=0;
    int answer=0;
    WidgetStateProperty<Color?> checkAnswer(int answerIndex){
      if(selectionAnswerIndex !=-1){
        if(answerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
            return const WidgetStatePropertyAll(Colors.green);
        }else if(selectionAnswerIndex==answerIndex){
            return const WidgetStatePropertyAll(Colors.red);
        }else{
          return const WidgetStatePropertyAll(null);
        }
      }else{
      return const WidgetStatePropertyAll(null);
      }
    }
    bool questionPage=true;
      
  @override
  Widget build(BuildContext context){
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
    if(questionPage==true){
      return Scaffold(
         appBar: AppBar(
        title: const Text("Quiz App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Colors.orange,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              Text("Questions:${currentQuestionIndex+1}/${allQuestions.length}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 380,
            height: 50,
            child: Text(allQuestions[currentQuestionIndex]["question"],
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.purple
            ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: (){
                if(selectionAnswerIndex ==-1){
                  selectionAnswerIndex=0;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][0],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=1;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][1],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=2;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][2],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: (){
                if(selectionAnswerIndex==-1){
                  selectionAnswerIndex=3;
                  setState(() {});
                }
              },
              child: Text(allQuestions[currentQuestionIndex]["options"][3],
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
              ),
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(selectionAnswerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
              count++;
            }
          if(selectionAnswerIndex !=-1){
            if(currentQuestionIndex<allQuestions.length-1){
              currentQuestionIndex++;
            }else{
              questionPage=false;
            }
            selectionAnswerIndex=-1;
            setState(() {});
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.forward,color: Colors.orange,),
      ),
    );
    }else {

    return Scaffold(
       appBar: AppBar(
        title: const Text("Result",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Colors.orange,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://up.yimg.com/ib/th?id=OIP.TtAx9qUoQCJnT-YsmfyTsQHaIh&pid=Api&rs=1&c=1&qlt=95&w=92&h=106",
            height: 300,
            ),
            const SizedBox(height: 30,),
            const Text("Congratulations",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.orange,
            ),
            ),
            const SizedBox(height: 30,),
            Text("Score:$count/${allQuestions.length}",
            style: const TextStyle(
              fontSize: 25,
            ),
            ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                //Color:  Colors.yellow,
              ),
              onPressed: (){
                if(questionPage==false){
                  questionPage = true;
          currentQuestionIndex = 0;
          selectionAnswerIndex = -1;
          count = 0;
                 
                  setState(() {});
                }
              },
              child: Text("RESTART",
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),
            ),
          ),
          ],
        ),

      ),
    /*  floatingActionButton: FloatingActionButton(
        onPressed: (){
         //if(questionPage==false){
           
          //questionPage=true;
      //   }
       //   if (questionPage == false) {
        setState(() {
          questionPage = true;
          currentQuestionIndex = 0;
          selectionAnswerIndex = -1;
          count = 0;
        });
   //   } else {
    //    Navigator.of(context).pop();
    //  }
        },


      ),

*/
           
      
    );
    }
  }
    }