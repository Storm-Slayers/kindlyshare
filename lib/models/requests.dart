class Requests {
  String _requestName;
  String _requestDesc;
  String _requestDate;
  String _userID;

  Requests(
      this._requestName, this._requestDesc, this._requestDate, this._userID);

  Requests.map(dynamic obj) {
    this._requestName = obj['requestName'];
    this._requestDesc = obj['requestDesc'];
    this._requestDate = obj['requestDate'];
    this._userID = obj['userID'];
  }

  String get requestName => _requestName;
  String get requestDesc => _requestDesc;
  String get requestDate => _requestDate;
  String get userID => _userID;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['requestName'] = _requestName;
    map['requestDesc'] = _requestDesc;
    map['requestDate'] = _requestDate;
    map['userID'] = _userID;
    return map;
  }

  Requests.fromMap(Map<String, dynamic> map) {
    this._requestName = map['requestName'];
    this._requestDesc = map['requestDesc'];
    this._requestDate = map['requestDate'];
    this._userID = map['userID'];
  }
}
