import 'package:service_pap/services/api.dart' as api;

// Future login(credentials) => api.post('/accounts/login/', credentials);
login(credentials) => api.post('/accounts/login/', credentials);
