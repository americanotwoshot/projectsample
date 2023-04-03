import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController controller = TextEditingController();
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('위치 설정',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('검색하고자 하는 지역의 동 이름을 입력해 주세요.'),
            Row(
              children: [
                Expanded(
                    child: TextField(controller: controller)
                ),
                ElevatedButton(
                    onPressed: (){
                      Map<String, String> params = {
                        'confmKey': 'devU01TX0FVVEgyMDIzMDMzMDIzMzU1NDExMzY0NDM=',
                        'currentPage': '1',
                        'countPerPage': '10',
                        'keyword': controller.text,
                        'resultType': 'json',
                      };
                      http.post(
                        //주소
                        Uri.parse('https://business.juso.go.kr/addrlink/addrLinkApi.do'),
                        //요청 본문
                        body: params,
                        headers: {
                          'content-type' : 'application/x-www-form-urlencoded',
                        }
                      )
                        .then((response){
                          var json = jsonDecode(response.body);
                          dev.log( json );
                          setState(() {
                            list = json['results']['juso'];
                          });
                        })
                        .catchError((error){
                          dev.log( error );
                        });
                    },
                    child: Text('검색')
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(5),
                  itemCount: list.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        TextButton(
                          onPressed: (){},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               border: Border.all(color: Colors.black)
                            ),
                            height: 50,
                            child: Text('${list[index]['roadAddr']}',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                       SizedBox(
                         height: 5,
                        )
                      ],
                    );
                 }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
