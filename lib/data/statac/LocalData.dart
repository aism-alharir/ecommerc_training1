class LocalDataProvider {
  // Sample data that would normally come from API
  static final Map<String, dynamic> _homeData = {
    'categories': {
      'data': [
        {
          'categories_id': '1',
          'categories_name': 'Electronics',
          'categories_name_ar': 'إلكترونيات',
          'categories_image': 'assets/images/Laptop .png',
        },
        {
          'categories_id': '2',
          'categories_name': 'Clothing',
          'categories_name_ar': 'ملابس',
          'categories_image': 'assets/images/Laptop .png',
        },
        // Add more categories as needed
      ]
    },
    'items': {
      'data': [
        {
          'items_id': '1',
          'items_name': 'Smartphone',
          'items_name_ar': 'هاتف ذكي',
          'items_desc': 'Latest smartphone model',
          'items_desc_ar': 'أحدث نموذج هاتف ذكي',
          'items_image': 'assets/images/Laptop .png',
          'items_price': '599.99',
          'items_discount': '0',
          'items_count': '100',
          'items_active': '1',
          'items_date': '2023-01-01',
          'categories_id': '1',
          'categories_name': 'Electronics',
        },
        // Add more items as needed
      ]
    },
    'settings': {
      'data': {
        'settings_titlehome': 'Welcome to our store',
        'settings_bodyhome': 'Find the best products at great prices',
        'settings_deliverytime': '30',
      }
    }
  };

  static final List<Map<String, dynamic>> _searchData = [
    {
      'items_id': '1',
      'items_name': 'Smartphone',
      'items_name_ar': 'هاتف ذكي',
      'items_image': 'assets/images/Laptop .png',
      'categories_name': 'Electronics',
    },
    // Add more search results as needed
  ];

  Future<Map<String, dynamic>> getHomeData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _homeData;
  }

  Future<List<Map<String, dynamic>>> searchItems(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (query.isEmpty) return [];
    
    return _searchData.where((item) {
      return item['items_name'].toString().toLowerCase().contains(query.toLowerCase()) ||
             item['items_name_ar'].toString().toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}