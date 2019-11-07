import 'package:flutter/material.dart';
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_app_study/Networking/http_networking_manager.dart';
import 'dart:convert';

class RxdartWidget extends StatefulWidget {
  RxdartWidget({Key key}) : super(key: key);

  @override
  _RxdartWidgetState createState() => _RxdartWidgetState();
}

class _RxdartWidgetState extends State<RxdartWidget>
    with RxDartClass, RxDartPublishSignal {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    observerForWhere();
//    observerForSkip();
//    observerForTake();
//    observerForDistinctUnique();
//    observerForMap();
//    observerForStartWith();
//    observerForMerge();
//    observerForCombineLatest();
//    observerForMerges();

//    merges([Stream.fromIterable([1, 2, 3, 4, 5, 6]), Stream.fromIterable([7, 8, 9, 10, 11, 12])]).listen((onData) {
//      print("++++++ result : ${onData}");
//    });

//    zips([Stream.fromIterable([1, 2, 3, 4, 5, 6]), Stream.fromIterable([7, 8, 9, 10, 11, 12]), Stream.fromIterable([0, 0, 0, 0, 0, 0])]).listen((onData) {
//      print("++++++ result : ${onData}");
//    });
//    zips([Stream.fromIterable([1, 2, 3, 4, 5, 6]), Stream.fromIterable([7, 8, 9, 10, 11, 12]), Stream.fromIterable([0, 0, 0, 0, 0, 0])]).map((values) {
//      return "result => : ${values}";
//    }).listen((onData) {
//      print(onData);
//    });

//    NetworkingManager.instance
//        .rxdartGetHttp(
//            "api-app/homepage/homepageDetail",
//            {
//              "corpNo": "33",
//              "idcardNo": "410482197603264529",
//              "deviceType": "2"
//            },
//            null)
//        .listen((response) {
//      print("runtimeType is4 =>: ${response.runtimeType}");
//      print("++++++ result : ${response.toResult()}");
//    });

//    NetworkingManager.instance.getHttp("api-app/homepage/homepageDetail", {"corpNo": "33", "idcardNo": "410482197603264529", "deviceType": "2"}, (response) {
//      print("++++++ result : ${response.toResult()}");
//    }, (response) {
//      print("++++++ result : ${response.toErrorString()}");
//    });


    GetterSetter.getterSetter();

//    NetworkingManager.instance.zipRequests([
//      NetworkingRequest.simple(
//          "api-app/homepage/homepageDetail",
//          {"corpNo": "33", "idcardNo": "410482197603264529", "deviceType": "2"},
//          true),
//      NetworkingRequest.simple(
//          "api-app/homepage/homepageDetail",
//          {"corpNo": "33", "idcardNo": "410482197603264529", "deviceType": "2"},
//          true),
//      NetworkingRequest.simple(
//          "api-app/homepage/homepageDetail",
//          {"corpNo": "33", "idcardNo": "410482197603264529", "deviceType": "2"},
//          true)
//    ]).listen((onData) {
//      print("++++++ result : ${onData}");
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RxDartClass {
  //where函数的作用是增加判断条件返回一个bool值来过滤不符合条件的signal
  observerForWhere() {
    Observable(Stream.fromIterable([1, 2, 3])).where((event) {
      return (event % 2 == 0);
    }).listen((onData) {
      print("observerForWhere result : ${onData}");
    });
  }

  //skip函数的作用是跳过Stream流前三次的signal，从第四次开始触发listen函数的监听
  observerForSkip() {
    Observable(Stream.fromIterable([1, 2, 3, 4, 5, 6]))
        .skip(3)
        .listen((onData) {
      print("observerForSkip result : ${onData}");
    });
  }

  //take函数的作用是限制Stream流的前两次触发次数，后面的四次触发listen函数不响应
  observerForTake() {
    Observable(Stream.fromIterable([1, 2, 3, 4, 5, 6]))
        .take(2)
        .listen((onData) {
      print("observerForTake result : ${onData}");
    });

  }

  //distinctUnique函数作用是过滤Stream流的signal中所包含的重新内容
  observerForDistinctUnique() {
    Observable(Stream.fromIterable([1, 1, 3, 3, 4, 4, 5, 6, 7, 7]))
        .distinctUnique()
        .listen((onData) {
      print("observerForDistinctUnique result : ${onData}");
    });
  }

  //map函数的作用是增加一个箭头函数，对Stream流的signal所包含的value做一次映射，并返回映射后的结果
  observerForMap() {
    Observable(Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8])).map((value) {
      return (value += 1);
    }).listen((onData) {
      print("observerForMap result : ${onData}");
    });
  }

  //startWith函数的作用是在Stream流中的signal数内的头部插入一条额外数据
  observerForStartWith() {
    Observable(Stream.fromIterable([1, 2, 3, 4, 5, 6, 7]))
        .startWith(8)
        .listen((onData) {
      print("observerForStartWith result : ${onData}");
    });
  }

  //merge函数的作用是合并多个Stream流，在listen函数监听时，多个Stream流中的signal数据可能会产生交错发送
  observerForMerge() {
    Observable.merge([
      Stream.fromIterable([1, 2, 3]),
      Stream.fromIterable([4, 5, 6])
    ]).listen((onData) {
      print("observerForStartWith result : ${onData}");
    });
  }

  observerForCombineLatest() {
    Observable.combineLatest([
      Observable(Stream.fromIterable([1, 2, 3])),
      Observable(Stream.fromIterable([4, 5, 6]))
    ], (value) {
      return value;
    }).listen((onData) {
      print("observerForCombineLatest result : ${onData}");
    });
  }

  observerForMerges() {
    Observable.merge([
      Observable(Stream.fromIterable([1, 2, 3])),
      Observable(Stream.fromIterable([4, 5, 6]))
    ]).listen((onData) {
      print("observerForMerges result : ${onData}");
    });
  }
}

//typedef StreamController HSYSignalBuild(List<Stream> streams);

class RxDartPublishSignal {
  //将多个Stream流的数据signal合并成一个一维的List后，通过PublishSubject的listen函数返回，并自动执行close函数关闭
  PublishSubject<List> merges(List<Stream> streams) {
    List datas = List();
    PublishSubject<List> subject = PublishSubject<List>();
    Observable.merge([Observable.concat(streams)]).listen((onData) {
      datas.add(onData);
    }).onDone(() {
      subject.add(datas);
      subject.close();
    });
    return subject;
  }

  //将多个Stream流的数据signal合并成一个二维的List后，通过PublishSubject的listen函数返回，并自动执行close函数关闭
  PublishSubject<List> zips(List<Stream> streams) {
    List<List> datas = List();
    PublishSubject<List> subject = PublishSubject<List>();
    Observable.zip(streams, (values) {
      return Observable.just(values);
    }).listen((onData) {
      onData.listen((value) {
        datas.add(value);
      });
    }).onDone(() {
      subject.add(datas);
      subject.close();
    });
    return subject;
  }

  getDetails(String userName, postName, {branch = "master"}) {}
}












class Person {
  String name;
  int age;

  //默认的构造函数，将参数赋值给属性name和属性age
  Person(this.name, this.age);

  //这是一个将参数赋值给属性name的构造函数
  Person.name(this.name);

  //这是一个箭头函数的工程方法，传入一个int型的参数，将其赋值给age属性，同事设置name属性为null
  factory Person.age(int age) => Person(null, 18);

  say(String name) {
    print("hello!, i'm ${name}");
  }
}

//class WhiteHuman extends Person {
//  @override
//  say(String name) {
//    // TODO: implement say
//    return super.say("lee ${name}");
//  }
//}

abstract class AbstractClass {
  var name;
  int id;

  abstractFunction() {
    print("AbstractClass无法实例化，AbstractClass只能用于作为定义接口适用");
  }

  dynamics(dynamic ary) {
    print("参数ary的运行时类型为: ary.runtimeType -> ${ary.runtimeType}");
  }

  printText(String text) {
    //当text == null时，代码会在这个断言中断
    assert(text != null);
    
    var tangele = Rectangle(10, 10);
//    print("sums: ${tangele.nums}");

  }



}

class FactoryClass {
  var propertyA;
  var propertyB;
  //默认的构造函数
  FactoryClass(this.propertyA, this.propertyB);
  //利用factory关键字修饰后的工厂方法构造函数
  factory FactoryClass.propertyA(var propertyA) =>
      FactoryClass(propertyA, null);
}


class Rectangle {
  num widths, heights;
  Rectangle(this.widths, this.heights);

  num get getSums => (heights + widths);
  set setNums(num value) => heights = value - widths;
}

class GetterSetter {

  num widths, heights;
  GetterSetter(this.widths, this.heights);

  num get getSums => (heights + widths);
  set setNums(num value) => (heights = value - widths);

  external toString();

  static getterSetter() {
    var getterSetter = GetterSetter(10, 20);
    print(getterSetter.getSums); //
    getterSetter.setNums = 100;
    print(getterSetter.getSums);
    print(getterSetter.heights);

    print(getterSetter.toString());

    var implementsClass = ImplementsClass();
    print(implementsClass.text("hehe"));

    UseClass.test();
  }
}

class Implements {
  //私有属性
  final floats;
  //不是接口，而是构造函数
  Implements(this.floats);
  //接口方法
  String text(String name) {
    print("name");
    return "你的名称：$name";
  }
}

class ImplementsClass implements Implements {
  //实现get&set
  get floats => 23;
  set floats(var value) => 0;
  //重新实现Implements的接口方法
  @override
  String text(String name) {
    // TODO: implement text
    return "我叫 hate";
  }
}

//声明一个返回值为bool类型的函数类型名称
typedef Completed = bool Function(Object a, Object b);

class TypedefClass {
  //为TypedefClass类添加一个Completed类型的函数对象
  Completed completed;
  //构造函数
  TypedefClass(this.completed);
}

class UseClass {
  //声明一个类方法
  static test() {
    //在调用构造函数的同时，声明Completed这个函数，并返回true
    var typedefClass = TypedefClass((Object a, Object b) {
      return true;
    });
    print(typedefClass.completed);//打印Closure: (Object, Object) => bool
  }
}