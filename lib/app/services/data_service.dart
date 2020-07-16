import 'package:desafio/app/services/http_service.dart';

class DataService {
  final HttpService http = HttpService();

  getPosts() {
    return http.get('/posts');
  }

  getPost({id}) {
    return http.get('/posts/$id');
  }

  getUser({id}) {
    return http.get('/users/$id');
  }
}
