import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

// Generate a MockHttpClient using Mockito
@GenerateMocks([http.Client])
void main() {}
