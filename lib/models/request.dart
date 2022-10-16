class DriverRequest {
  final int id;
  final String nameRequest;
  final String carName;
  final int carNumber;
  String status;
  final String carCharacteristic;
  final String carType;
  final String startTime;
  final String endTime;
  final String requestCreator;
  final String comment;
  final List points;

  DriverRequest(
      this.id,
      this.nameRequest,
      this.carName,
      this.carNumber,
      this.status,
      this.carCharacteristic,
      this.carType,
      this.startTime,
      this.endTime,
      this.requestCreator,
      this.comment,
      this.points);

  factory DriverRequest.fromJson(map) {
    return DriverRequest(
        map['id'],
        map['nameRequest'],
        map['carName'],
        map['carNumber'],
        map['status'],
        map['carCharacteristic'],
        map['carType'],
        map['startTime'],
        map['endTime'],
        map['requestCreator'],
        map['comment'],
        map['points']);
  }

  @override
  String toString() {
    return '''{
"id": $id,
"nameRequest": "$nameRequest",
"carName": "$carName",
"carNumber": "$carNumber",
"status": "$status",
"carCharacteristic": "$carCharacteristic",
"carType": "$carType",
"startTime": "$startTime",
"endTime": "$endTime",
"requestCreator": "$requestCreator",
"comment": "$comment",
"points": $points
      }''';
  }
}
