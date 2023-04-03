import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<Map> categories_first = [
    {"name": "전체보기", "isChecked": false},
    {"name": "맛집/카페", "isChecked": false},
    {"name": "주류", "isChecked": false},
    {"name": "영화/드라마", "isChecked": false},
  ];

  List<Map> categories_second = [
    {"name": "게임", "isChecked": false},
    {"name": "봉사", "isChecked": false},
    {"name": "독서", "isChecked": false},
    {"name": "스터디", "isChecked": false},
  ];

  List<Map> categories_third = [
    {"name": "반려동물", "isChecked": false},
    {"name": "전시/공연", "isChecked": false},
    {"name": "운동", "isChecked": false},
  ];

  List<bool> isSelected1 = [true];
  List<bool> isSelected2 = [false];
  List<bool> isSelected3 = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('필터',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Column(
        children:[
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text("카테고리", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row( // 카테고리 첫 번째 줄
            children: categories_first.map((category){
              return Container(
                width: 120,
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: category["isChecked"],
                      onChanged: (newValue){
                        setState(() {
                          category["isChecked"] = newValue;
                        });
                      }),
                    Text(category["name"],style: TextStyle(fontSize: 15)),
                  ],
                ),
              );
            }).toList(),
          ),
          Row( // 카테고리 두 번째 줄
            children: categories_second.map((category){
              return Container(
                width: 120,
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: category["isChecked"],
                        onChanged: (newValue){
                          setState(() {
                            category["isChecked"] = newValue;
                          });
                        }),
                    Text(category["name"],style: TextStyle(fontSize: 15)),
                  ],
                ),
              );
            }).toList(),
          ),
          Row( // 카테고리 세 번째 줄
            children: categories_third.map((category){
              return Container(
                width: 120,
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: category["isChecked"],
                        onChanged: (newValue){
                          setState(() {
                            category["isChecked"] = newValue;
                          });
                        }),
                    Text(category["name"],style: TextStyle(fontSize: 15)),
                  ],
                ),
              );
            }).toList(),
          ),
          Divider(thickness: 1,color: Colors.black12,),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text("정렬", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ToggleButtons(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  constraints: BoxConstraints.expand(
                    width: 140,
                  ),
                  isSelected: isSelected1,
                  onPressed: (int index){
                    setState(() {
                      isSelected1[index] = true;
                      isSelected2[index] = false;
                      isSelected3[index] = false;
                    });
                  },
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.0),
                        child: Text("최신순")),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ToggleButtons(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  constraints: BoxConstraints.expand(
                    width: 140,
                  ),
                  isSelected: isSelected2,
                  onPressed: (int index){
                    setState(() {
                      isSelected1[index] = false;
                      isSelected2[index] = true;
                      isSelected3[index] = false;
                    });
                  },
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.0),
                        child: Text("마감 임박 순")),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ToggleButtons(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  constraints: BoxConstraints.expand(
                    width: 140,
                  ),
                  isSelected: isSelected3,
                  onPressed: (int index){
                    setState(() {
                      isSelected1[index] = false;
                      isSelected2[index] = false;
                      isSelected3[index] = true;
                    });
                  },
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: Text("참여 높은 순")),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 270,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black12),
                ),
                width: 220,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: (){
                    setState(() {

                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: Text("적용")),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black12),
                ),
                width: 220,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      for(int index = 0; index < categories_first.length; index++){
                        categories_first[index]["isChecked"] = false;
                        categories_second[index]["isChecked"] = false;
                      }
                      for(int index = 0; index < categories_third.length; index++){
                        categories_third[index]["isChecked"] = false;
                      }
                      isSelected1[0] = true;
                      isSelected2[0] = false;
                      isSelected3[0] = false;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8.0),
                      child: Text("초기화")),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
