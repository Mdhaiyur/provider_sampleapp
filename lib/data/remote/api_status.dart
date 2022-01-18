class Success{
  int? code;
  Object? successResponse;
  Success({this.code,this.successResponse});
}

class Failure{
  int? code;
  Object? errorResponse;
  Failure({this.code,this.errorResponse});
}