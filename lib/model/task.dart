class Task {
  int _id = 0;
  String _title = '';
  //String _description = '';

  int _counter = 0;

  Task() {
    this._id = _counter++;
  }

  Task.name(String t) {
    this._id = _counter++;
    this._title = t;
    //this._description = d;
  }

  int getId() {
    return _id;
  }

  void setTitle(String t) {
    _title = t;
  }

  String getTitle() {
    return _title;
  }

  /*void setDescription(String s) {
    _description = s;
  }

  String getDescription() {
    return _description;
  }*/
}
