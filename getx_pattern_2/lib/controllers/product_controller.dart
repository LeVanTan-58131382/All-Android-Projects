import 'package:get/state_manager.dart';
import 'package:getx_pattern_2/models/product.dart';
import 'package:getx_pattern_2/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  // Co the su dung
  // List<Product> products = [].obs;
  //  Hoac var products = <Product>[].obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
