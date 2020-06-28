class DummyData {
  String imageUrl;
  String requestName;
  String requestDesc;
  String requestDate;
  bool isFeatured;

  DummyData(
      {this.imageUrl,
      this.requestDate,
      this.requestDesc,
      this.requestName,
      this.isFeatured});
}

List<DummyData> dummyRequest = [
  DummyData(
    imageUrl: '',
    requestDate: '',
    requestDesc: '',
    requestName: '',
    isFeatured: false,
  ),
  DummyData(
    imageUrl: '',
    requestDate: '01/01/01',
    requestDesc: 'Some Dummy Text',
    requestName: 'Dummy Title',
    isFeatured: false,
  ),
  DummyData(
    imageUrl: '',
    requestDate: '01/01/01',
    requestDesc: 'Some Dummy Text 2',
    requestName: 'Dummy Title 2',
    isFeatured: true,
  ),
  DummyData(
    imageUrl: '',
    requestDate: '01/01/01',
    requestDesc: 'Some Dummy Text 3',
    requestName: 'Dummy Title 3',
    isFeatured: true,
  ),
  DummyData(
    imageUrl: '',
    requestDate: '01/01/01',
    requestDesc: 'Some Dummy Text 3',
    requestName: 'Dummy Title 3',
    isFeatured: true,
  ),
];
