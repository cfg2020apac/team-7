import 'package:flutter/material.dart';
import 'package:team7_app/components/caregiverCard.dart';

class CaregiverList extends StatelessWidget {

  List<Client> matches = [Client('Adam', 'Tan', 89.5), Client('Darren', 'Lim', 84.5),Client('Dan', 'Loh', 80.5),Client('John', 'Lim', 78.5),Client('Ben', 'Wong', 72.5)];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Client Details",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.blue[600],
            brightness: Brightness.light,
            elevation: 0,
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        backgroundColor: Colors.white,
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: [
          Column(children: <Widget>[
          SizedBox(height: 30),
              Row(
                children: <Widget>[
                  SizedBox(width: 10),
                  Icon(
                    Icons.supervised_user_circle,
                    size: 50,
                    color: Colors.blue[600],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text("Client Name: Jacob Lee",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                      Text("Client Gender: Male",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                      Text("Client Age: 45",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                      Text("Preferred Location: West",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                      Text("Habits: Smoker, Light Sleeper",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                      Text("Moving In: 2 months",
                          style: TextStyle(
                              fontSize: 20, color: Colors.blue[600])),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20.0,),
                  Column(
                    children: [
                      Text("Top 5 Recommended \nflatmates",
                          style: TextStyle(
                              fontSize: 24, color: Colors.black)),
                    ],
                  )
                ],
              ),
              // care giver card
              SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                          title: Column(
                            children: <Widget>[
                              Divider(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 100.0,
                                        child: Text(
                                          matches[index].firstName + ' ' + matches[index].lastName.toUpperCase(),
                                          style: new TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight:
                                              FontWeight.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        width: 150.0,
                                        child: RaisedButton(
                                          onPressed: null,
                                          color: Colors.green,
                                          child: Text(
                                            matches[index].matchScore.toString() + '% Match',
                                            style: new TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight:
                                                FontWeight.normal),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  18.0)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ));
                    }),
              SizedBox(height: 20,),
              Text("Caregivers Assigned",
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              SizedBox(height: 10),
              CaregiverCard("1"),
              SizedBox(height: 10),
              CaregiverCard("2"),
              SizedBox(height: 10),
              CaregiverCard("3"),
            ],
            ),
          ]),
        )));
  }
}


class ClientMatch {
  final Client client1;
  final Client client2;
  final Client client3;
  final Client client4;
  final Client client5;
  ClientMatch(this.client1,this.client2,this.client3,this.client4,this.client5);
}

class Client {
  final String firstName;
  final String lastName;
  final double matchScore;
  Client(this.firstName, this.lastName, this.matchScore);
}