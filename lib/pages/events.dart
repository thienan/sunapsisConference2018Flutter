import 'package:flutter/material.dart';
import 'package:sunapsis_conference18/blocs/login_bloc.dart';
import 'package:sunapsis_conference18/blocs/login_bloc_provider.dart';
import 'package:sunapsis_conference18/widgets/event_list.dart';

class Events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventsState();
}

class EventsState extends State<Events> with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  TabController _tabController;
  final List<Tab> dateTabs = <Tab>[
    Tab(
      text: 'All',
      icon: Icon(Icons.list),
    ),
    Tab(
      text: 'Sep 29',
      icon: Icon(Icons.event),
    ),
    Tab(
      text: 'Sep 30',
      icon: Icon(Icons.event),
    ),
    Tab(
      text: 'Oct 1',
      icon: Icon(Icons.event),
    ),
    Tab(
      text: 'Oct 2',
      icon: Icon(Icons.event),
    ),
    Tab(
      text: 'Oct 3',
      icon: Icon(Icons.event),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: dateTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginBlocProvider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Events"),
          bottom: TabBar(
            isScrollable: true,
            tabs: dateTabs,
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            EventList(0),
            EventList(1),
            EventList(2),
            EventList(3),
            EventList(4),
            EventList(5),
          ],
        ));
  }
}
