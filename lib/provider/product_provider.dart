import 'package:SIKOMPAK/models/product.dart';
import 'package:SIKOMPAK/service/api_service.dart';
import 'package:flutter/material.dart';

class SortBy {
  String value;
  String text;
  String sortOrder;

  SortBy(this.value, this.text, this.sortOrder);
}

enum LoadMoreStatus { INITIAL, STABLE, LOADING }

class ProductProvider with ChangeNotifier {
  APIService apiService;
  List<Product> _productList;
  SortBy sortBy;
  int pageSize = 10;

  List<Product> get allProducts => _productList;

  double get totalRecords => _productList.length.toDouble();

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;

  getLoadMoreStatus() => _loadMoreStatus;

  ProductProvider() {
    sortBy = SortBy("modified", "Latest", "asc");
  }
  void resetStreams() {
    apiService = APIService();
    _productList = List<Product>();
  }

  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }

  setSortOrder(SortBy sortBy) {
    sortBy = sortBy;
    notifyListeners();
  }

  fetchProducts(
    pageNumber, {
    String strSearch,
    String tagName,
    String categoryId,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> itemModel = await apiService.getProducts(
      strSearch: strSearch,
      tagName: tagName,
      pageNumber: pageNumber,
      pageSize: this.pageSize,
      categoryId: categoryId,
      sortBy: this.sortBy.value,
      sortOrder: this.sortBy.sortOrder,
    );
    if (itemModel.length > 0) {
      _productList.addAll(itemModel);
    }
    setLoadingState(LoadMoreStatus.STABLE);
    notifyListeners();
  }
}
