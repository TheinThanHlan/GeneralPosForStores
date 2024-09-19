import '../../all.dart';
class Template implements IMVCModel{ 
	int? id=0;
	DateTime? createdDateTime;
	Template({ this.id, this.createdDateTime});
	Map<String, dynamic> toJson() => {"id":id,"createdDateTime":createdDateTime};
	Map<String, dynamic> toJsonWithoutDbAuto() => {};
	Template.fromJson(Map<String,dynamic> data): id=data["id"],createdDateTime=DateTime.parse(data["createdDateTime"]);

}
