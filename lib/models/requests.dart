class Requests{
  String _requestName;
  String _requestDesc;
  String _requestDate;

  Requests(this._requestName, this._requestDesc, this._requestDate);

  Requests.map(dynamic obj){
    this._requestName = obj['requestName'];
    this._requestDesc = obj['requestDesc'];
    this._requestDate = obj['requestDate'];
  }

  String get requestName => _requestName;
  String get requestDesc => _requestDesc;
  String get requestDate => _requestDate;
  
  Map<String,dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['requestName']=_requestName;
    map['requestDesc']=_requestDesc;
    map['requestDate']=_requestDate; 
    return map;
  }

  Requests.fromMap(Map<String,dynamic> map){
    this._requestName = map['requestName'];
    this._requestDesc = map['requestDesc'];
    this._requestDate = map['requestDate'];
  }
}