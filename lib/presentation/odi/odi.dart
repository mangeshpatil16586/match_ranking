import 'package:flutter/material.dart';
import '../../repository/repostiory.dart';
import '../homepage/homepage_viewmodel.dart';

class Odi extends StatefulWidget {
   Odi({Key? key}) : super(key: key);

  @override
  State<Odi> createState() => _OdiState();
}

class _OdiState extends State<Odi> {
  var _viewmodel=HomePageViewModel();
  bool listOfMatch = false;
  bool btn1=false;
  bool btn2=false;
  bool btn3=false;
  bool btn4=false;


  @override
  void initState() {
    btn1=true;
    addDataToList();
    super.initState();
  }
  addDataToList() async{
    _viewmodel.addToStream(await Repository().getOdiBatsman());
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () async{
                        setState((){
                          listOfMatch=false;
                          btn1=true;
                          btn2=false;
                          btn3=false;
                          btn4=false;
                        });
                        var player=await Repository().getOdiBatsman();
                        _viewmodel.addToStream(await Repository().getOdiBatsman());
                      },
                      style: ButtonStyle(
                          backgroundColor: btn1?MaterialStateProperty.all<Color>(Colors.amberAccent)
                              :MaterialStateProperty.all<Color>(Colors.white)
                      ),
                      child:Text('Batsmen'),
                    ),
                    TextButton(onPressed: () async{
                      setState((){
                        listOfMatch=false;
                        btn1=false;
                        btn2=true;
                        btn3=false;
                        btn4=false;
                      });

                      _viewmodel.addToStream(await Repository().getOdiBowler());

                    },

                        style: ButtonStyle(
                            backgroundColor: btn2?MaterialStateProperty.all<Color>(Colors.amberAccent)
                                :MaterialStateProperty.all<Color>(Colors.white)
                        ),
                        child:Text('Bowlers')),
                    TextButton(onPressed: () async{
                      setState((){
                        listOfMatch=false;
                        btn1=false;
                        btn2=false;
                        btn3=true;
                        btn4=false;
                      });
                      _viewmodel.addToStream(await Repository().getAllRounder());
                    },
                        style: ButtonStyle(
                            backgroundColor: btn3?MaterialStateProperty.all<Color>(Colors.amberAccent)
                                :MaterialStateProperty.all<Color>(Colors.white)
                        ),

                        child:Text('AllRounders')),

                    TextButton(onPressed: () async{
                      setState((){
                        listOfMatch=true;
                        btn1=false;
                        btn2=false;
                        btn3=false;
                        btn4=true;
                      });
                      _viewmodel.inputMatchList.add(await Repository().getODITeams());

                    },
                        style: ButtonStyle(
                            backgroundColor: btn4?MaterialStateProperty.all<Color>(Colors.amberAccent)
                                :MaterialStateProperty.all<Color>(Colors.white)
                        ),
                        child:Text('Teams')),
                  ],
                ),
                !listOfMatch
                    ?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Rank',style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text('Players',style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text('Points',style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                  ],
                )
                     :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Rank',style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text('Teams',style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text('Rating',style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
                    Text('Teams',style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 500,
                    child: listOfMatch? listOfTeams(): listOfPlayers()
                  ),
                )

              ]
          )
      ),
    );
  }

  Widget listOfTeams(){
    return  StreamBuilder(
        stream: _viewmodel.outputMatchList,
        builder: (context,snapshot){
          var data=snapshot.data;
          if(data==null){
            return Text('Data is Loading..');
          }
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(data[index].position.toString()),
                  Text(data[index].team_name.toString().replaceAll(' ', '')),
                  Text(data[index].rating.toString()),
                  Text(data[index].points.toString()),
                ],
              );
            },
            separatorBuilder: (BuildContext context,int index)=>const Divider(),
          );
        });
  }
  Widget listOfPlayers(){
    return StreamBuilder(
        stream: _viewmodel.outputPlayerList,
        builder: (context,snapshot){
          var data=snapshot.data;
          if(data==null){
            return Text('Data is Loading..');
          }
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(data[index].position.toString()),
                  Text(data[index].player_name.toString()),
                  Text(data[index].points.toString()),
                ],
              );
            },
            separatorBuilder: (BuildContext context,int index)=>const Divider(),

          );
        });
  }
}
