import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home_mobile/app/common/helper/mqtt_helper.dart';
import 'package:smart_home_mobile/app/common/utils/date_time.dart';
import 'package:smart_home_mobile/app/domain/entities/appliance.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/home_controller.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/widgets/device_card_item.dart';
import 'package:smart_home_mobile/scopedModel/connectedModel.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: 258,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 50,
              bottom: 30,
              left: 30,
              right: 30.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff669df4), Color(0xff4e80f3)]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: _upperContainer(),
        ),
        _roomCategories(),
        Obx(() {
  return _applianceGrid(controller.model.value);
})
      ]),
    );
  }

  Widget _upperContainer() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateTimeUtils.getStringDate(DateTime.now(), Pattern.ddMMMMyyyy),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Hello Star!',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
              GestureDetector(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://store.playstation.com/store/api/chihiro/00_09_000/container/US/en/999/UP1018-CUSA00133_00-AV00000000000015/1553561653000/image?w=256&h=256&bg_color=000000&opacity=100&_version=00_09_000'),
                ),
                onTap: () {
                  /*
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ));*/
                },
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(25)),
                child: Icon(
                  Icons.power,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '7.9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'kwh',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Text(
                    'Power uses for today',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _roomCategories() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Text(
              'Bedroom',
              style: TextStyle(
                  color: Color(0xff4e80f3),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 25,
            ),
            _roomLabel(
              'Living Room',
            ),
            SizedBox(
              width: 25,
            ),
            _roomLabel(
              'Study Room',
            ),
            SizedBox(
              width: 25,
            ),
            _roomLabel(
              'Kitchin',
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget _roomLabel(String title) {
    return Text(
      'Kitchin',
      style: TextStyle(
          color: Color(0xffb2b0b9), fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget _applianceGrid(ApplianceListModel model) {
    return Expanded(
      child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            padding: EdgeInsets.all(0),
            children: List.generate(model.allYatch.length, (index) {
              return model.allYatch[index].title != null
                  ? DeviceCard(
                      model: model.allYatch[index],
                      onChange: (bool) {
                        model.allYatch[index].changeDeviceStatus(bool);
                        model.allYatch[index].pushDeviceStatus();
                      },
                    )
                  : Container(
                      height: 120,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                      margin: index % 2 == 0
                          ? EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5)
                          : EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
                      decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(0, 10),
                                color: Color(0xfff1f0f2))
                          ],
                          color: Colors.white,
                          border: Border.all(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color(0xffa3a3a3)),
                          borderRadius: BorderRadius.circular(20)),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          //todo add device api
                        },
                      ),
                    );
            }),
          )),
    );
  }

}
