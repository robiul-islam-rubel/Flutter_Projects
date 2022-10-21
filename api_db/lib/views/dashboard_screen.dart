/*
* File : LMS Dashboard
* Version : 1.0.0
* */


import 'package:flutter/material.dart';


class LMSDashboardScreen extends StatefulWidget {
  @override
  _LMSDashboardScreenState createState() => _LMSDashboardScreenState();
}

class _LMSDashboardScreenState extends State<LMSDashboardScreen> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashbord"),
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(size: 50,

              (Icons.account_circle_rounded),

            ),
          ),

        ),
        body: Container(
            color: Colors.redAccent,
            child: ListView(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text("PROGRESS",
                       )),
                Container(
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      children: <Widget>[
                        _SingleSubject(
                          completed: 58,
                          subject: 'ALL',
                          backgroundColor: Colors.blue,
                        ),
                        _SingleSubject(
                          completed: 45,
                          subject: 'Mathematics',
                          backgroundColor: Colors.red,
                        ),
                        _SingleSubject(
                          completed: 68,
                          subject: 'Science',
                          backgroundColor: Colors.green,
                        ),
                        _SingleSubject(
                          completed: 32,
                          subject: 'Other',
                          backgroundColor: Colors.orange,
                        ),
                      ]
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Text("SUBMISSIONS",style: TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.3)),
                ),
                Container(
                  child: _SubmissionWidget(),
                )
              ],
            )));
  }
}

class _SingleSubject extends StatelessWidget {
  final Color backgroundColor;
  final String subject;
  final int completed;

  const _SingleSubject(
      {Key? key,
        required this.backgroundColor,
        required this.subject,
        required this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class _SubmissionWidget extends StatefulWidget {
  @override
  _SubmissionWidgetState createState() => _SubmissionWidgetState();
}

class _SubmissionWidgetState extends State<_SubmissionWidget> {
  int _currentStep = 0;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Stepper(
      physics: ClampingScrollPhysics(),
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return _buildControlBuilder(_currentStep);
      },
      currentStep: _currentStep,
      onStepTapped: (pos) {
        setState(() {
          _currentStep = pos;
        });
      },
      steps: <Step>[
        Step(
          isActive: true,
          title: Text('Due - 30, Apr', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text('Science (figure 2.3)', ),
          state: StepState.indexed,
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",
                style:TextStyle(color: theme.colorScheme.onBackground)),
          ),
        ),
        Step(
          isActive: true,
          state: StepState.indexed,
          title: Text('Due - 28, Apr', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle:
          Text('Mathematics lession', style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",),
          ),
        ),
        Step(
            isActive: true,
            state: StepState.complete,
            title: Text('Completed - 14, Apr',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('Due - 28, Apr', style: TextStyle(fontWeight: FontWeight.bold),),
            content: Container(
              width: MediaQuery.of(context).size.width,
              child:  Text(
                " - It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.,",),
            ),
        ),
        Step(
          isActive: true,
          state: StepState.complete,
          title:  Text('Completed - 20, Apr',style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle:
          Text('Mathematics (lesson - 1)',style: TextStyle(fontWeight: FontWeight.bold),),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.only(top: 8),
                    child: Text("Submitted".toUpperCase(),style: TextStyle(
          color: theme.colorScheme.onSecondary,
          letterSpacing: 0.3,
          fontWeight: FontWeight.bold)
    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildControlBuilder(int position) {
    if (position == 0 || position == 1) {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(

              onPressed: () {},
            child: Text("Submitted".toUpperCase(),style: TextStyle(
                color: theme.colorScheme.onSecondary,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold)
            ),
        ),
        )
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {},

            child: Text("Submitted".toUpperCase(),style: TextStyle(
                color: theme.colorScheme.onSecondary,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold)
    ),
      ),
    )
    );

  }
}
