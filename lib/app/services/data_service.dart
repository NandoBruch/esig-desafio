import 'package:desafio/app/services/http_service.dart';

class DataService {
  final HttpService http = HttpService();

  getPosts() async {
    return await http.get('/posts');
  }

  getPost({id}) async {
    return await http.get('/posts/$id');
  }

  getUser({id}) async {
    return await http.get('/users/$id');
  }
}
