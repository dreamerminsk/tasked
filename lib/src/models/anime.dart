class Anime {

}

Class
class DemoModel {
  int num1;
  int num2;

  DemoModel({this.num1, this.num2});

  DemoModel.fromJson(Map<String, dynamic> json) {
    num1 = json['num1'];
    num2 = json['num2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num1'] = this.num1;
    data['num2'] = this.num2;
    return data;
  }
}
