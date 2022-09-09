/// id : 6
/// added_by : "admin"
/// user_id : 1
/// name : "test three large unit"
/// slug : "test-three-large-unit-B9LhAt"
/// category_ids : [{"id":"2","position":1}]
/// brand_id : 36
/// unit : "gms"
/// min_qty : 1
/// refundable : 1
/// images : null
/// thumbnail : "def.png"
/// featured : null
/// flash_deal : null
/// video_provider : "youtube"
/// video_url : null
/// colors : []
/// variant_product : 0
/// attributes : []
/// choice_options : []
/// variation : []
/// published : 0
/// unit_price : 10
/// purchase_price : 8
/// tax : 0
/// tax_type : "percent"
/// discount : 0
/// discount_type : "flat"
/// current_stock : 100
/// details : "test"
/// free_shipping : 0
/// attachment : null
/// created_at : "2022-05-01T12:24:30.000000Z"
/// updated_at : "2022-05-11T21:38:53.000000Z"
/// status : 1
/// featured_status : 1
/// meta_title : null
/// meta_description : null
/// meta_image : "def.png"
/// request_status : 1
/// denied_note : null
/// shipping_cost : 0
/// multiply_qty : 0
/// temp_shipping_cost : null
/// is_shipping_cost_updated : null
/// parcode : "32323232"
/// large_unit : "ltrs"
/// large_unit_parcode : "d323232"
/// large_unit_quantity : 8
/// large_unit_price : "800"
/// reviews_count : 0
/// quantity_from_pc : 8
/// reviews : []
/// translations : []
//
// class Product {
//   Product({
//       int id,
//       String addedBy,
//       int userId,
//       String name,
//       String slug,
//       List<CategoryIds> categoryIds,
//       int brandId,
//       String unit,
//       int minQty,
//       int refundable,
//       dynamic images,
//       String thumbnail,
//       dynamic featured,
//       dynamic flashDeal,
//       String videoProvider,
//       dynamic videoUrl,
//       List<dynamic> colors,
//       int variantProduct,
//       List<dynamic> attributes,
//       List<dynamic> choiceOptions,
//       List<dynamic> variation,
//       int published,
//       int unitPrice,
//       int purchasePrice,
//       int tax,
//       String taxType,
//       int discount,
//       String discountType,
//       int currentStock,
//       String details,
//       int freeShipping,
//       dynamic attachment,
//       String createdAt,
//       String updatedAt,
//       int status,
//       int featuredStatus,
//       dynamic metaTitle,
//       dynamic metaDescription,
//       String metaImage,
//       int requestStatus,
//       dynamic deniedNote,
//       int shippingCost,
//       int multiplyQty,
//       dynamic tempShippingCost,
//       dynamic isShippingCostUpdated,
//       String parcode,
//       String largeUnit,
//       String largeUnitParcode,
//       int largeUnitQuantity,
//       String largeUnitPrice,
//       int reviewsCount,
//       int quantityFromPc,
//       List<dynamic> reviews,
//       List<dynamic> translations,}){
//     _id = id;
//     _addedBy = addedBy;
//     _userId = userId;
//     _name = name;
//     _slug = slug;
//     _categoryIds = categoryIds;
//     _brandId = brandId;
//     _unit = unit;
//     _minQty = minQty;
//     _refundable = refundable;
//     _images = images;
//     _thumbnail = thumbnail;
//     _featured = featured;
//     _flashDeal = flashDeal;
//     _videoProvider = videoProvider;
//     _videoUrl = videoUrl;
//     _colors = colors;
//     _variantProduct = variantProduct;
//     _attributes = attributes;
//     _choiceOptions = choiceOptions;
//     _variation = variation;
//     _published = published;
//     _unitPrice = unitPrice;
//     _purchasePrice = purchasePrice;
//     _tax = tax;
//     _taxType = taxType;
//     _discount = discount;
//     _discountType = discountType;
//     _currentStock = currentStock;
//     _details = details;
//     _freeShipping = freeShipping;
//     _attachment = attachment;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _status = status;
//     _featuredStatus = featuredStatus;
//     _metaTitle = metaTitle;
//     _metaDescription = metaDescription;
//     _metaImage = metaImage;
//     _requestStatus = requestStatus;
//     _deniedNote = deniedNote;
//     _shippingCost = shippingCost;
//     _multiplyQty = multiplyQty;
//     _tempShippingCost = tempShippingCost;
//     _isShippingCostUpdated = isShippingCostUpdated;
//     _parcode = parcode;
//     _largeUnit = largeUnit;
//     _largeUnitParcode = largeUnitParcode;
//     _largeUnitQuantity = largeUnitQuantity;
//     _largeUnitPrice = largeUnitPrice;
//     _reviewsCount = reviewsCount;
//     _quantityFromPc = quantityFromPc;
//     _reviews = reviews;
//     _translations = translations;
// }
//
//   Product.fromJson(dynamic json) {
//     _id = Parser.parseString(json['id']);
//     _addedBy = Parser.parseString(json['added_by']);
//     _userId = Parser.parseString(json['user_id']);
//     _name = Parser.parseString(json['name']);
//     _slug = Parser.parseString(json['slug']);
//     if (json['category_ids'] != null) {
//       _categoryIds = [];
//       json['category_ids'].forEach((v) {
//         _categoryIds.add(CategoryIds.fromJson(v));
//       });
//     }
//     _brandId = Parser.parseString(json['brand_id']);
//     _unit = Parser.parseString(json['unit']);
//     _minQty = Parser.parseString(json['min_qty']);
//     _refundable = Parser.parseString(json['refundable']);
//     _images = Parser.parseString(json['images']);
//     _thumbnail = Parser.parseString(json['thumbnail']);
//     _featured = Parser.parseString(json['featured']);
//     _flashDeal = Parser.parseString(json['flash_deal']);
//     _videoProvider = Parser.parseString(json['video_provider']);
//     _videoUrl = Parser.parseString(json['video_url']);
//     if (json['colors'] != null) {
//       _colors = [];
//       json['colors'].forEach((v) {
//         _colors.add(Dynamic.fromJson(v));
//       });
//     }
//     _variantProduct = Parser.parseString(json['variant_product']);
//     if (json['attributes'] != null) {
//       _attributes = [];
//       json['attributes'].forEach((v) {
//         _attributes.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['choice_options'] != null) {
//       _choiceOptions = [];
//       json['choice_options'].forEach((v) {
//         _choiceOptions.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['variation'] != null) {
//       _variation = [];
//       json['variation'].forEach((v) {
//         _variation.add(Dynamic.fromJson(v));
//       });
//     }
//     _published = Parser.parseString(json['published']);
//     _unitPrice = Parser.parseString(json['unit_price']);
//     _purchasePrice = Parser.parseString(json['purchase_price']);
//     _tax = Parser.parseString(json['tax']);
//     _taxType = Parser.parseString(json['tax_type']);
//     _discount = Parser.parseString(json['discount']);
//     _discountType = Parser.parseString(json['discount_type']);
//     _currentStock = Parser.parseString(json['current_stock']);
//     _details = Parser.parseString(json['details']);
//     _freeShipping = Parser.parseString(json['free_shipping']);
//     _attachment = Parser.parseString(json['attachment']);
//     _createdAt = Parser.parseString(json['created_at']);
//     _updatedAt = Parser.parseString(json['updated_at']);
//     _status = Parser.parseString(json['status']);
//     _featuredStatus = Parser.parseString(json['featured_status']);
//     _metaTitle = Parser.parseString(json['meta_title']);
//     _metaDescription = Parser.parseString(json['meta_description']);
//     _metaImage = Parser.parseString(json['meta_image']);
//     _requestStatus = Parser.parseString(json['request_status']);
//     _deniedNote = Parser.parseString(json['denied_note']);
//     _shippingCost = Parser.parseString(json['shipping_cost']);
//     _multiplyQty = Parser.parseString(json['multiply_qty']);
//     _tempShippingCost = Parser.parseString(json['temp_shipping_cost']);
//     _isShippingCostUpdated = Parser.parseString(json['is_shipping_cost_updated']);
//     _parcode = Parser.parseString(json['parcode']);
//     _largeUnit = Parser.parseString(json['large_unit']);
//     _largeUnitParcode = Parser.parseString(json['large_unit_parcode']);
//     _largeUnitQuantity = Parser.parseString(json['large_unit_quantity']);
//     _largeUnitPrice = Parser.parseString(json['large_unit_price']);
//     _reviewsCount = Parser.parseString(json['reviews_count']);
//     _quantityFromPc = Parser.parseString(json['quantity_from_pc']);
//     if (json['reviews'] != null) {
//       _reviews = [];
//       json['reviews'].forEach((v) {
//         _reviews.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['translations'] != null) {
//       _translations = [];
//       json['translations'].forEach((v) {
//         _translations.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   int _id;
//   String _addedBy;
//   int _userId;
//   String _name;
//   String _slug;
//   List<CategoryIds> _categoryIds;
//   int _brandId;
//   String _unit;
//   int _minQty;
//   int _refundable;
//   dynamic _images;
//   String _thumbnail;
//   dynamic _featured;
//   dynamic _flashDeal;
//   String _videoProvider;
//   dynamic _videoUrl;
//   List<dynamic> _colors;
//   int _variantProduct;
//   List<dynamic> _attributes;
//   List<dynamic> _choiceOptions;
//   List<dynamic> _variation;
//   int _published;
//   int _unitPrice;
//   int _purchasePrice;
//   int _tax;
//   String _taxType;
//   int _discount;
//   String _discountType;
//   int _currentStock;
//   String _details;
//   int _freeShipping;
//   dynamic _attachment;
//   String _createdAt;
//   String _updatedAt;
//   int _status;
//   int _featuredStatus;
//   dynamic _metaTitle;
//   dynamic _metaDescription;
//   String _metaImage;
//   int _requestStatus;
//   dynamic _deniedNote;
//   int _shippingCost;
//   int _multiplyQty;
//   dynamic _tempShippingCost;
//   dynamic _isShippingCostUpdated;
//   String _parcode;
//   String _largeUnit;
//   String _largeUnitParcode;
//   int _largeUnitQuantity;
//   String _largeUnitPrice;
//   int _reviewsCount;
//   int _quantityFromPc;
//   List<dynamic> _reviews;
//   List<dynamic> _translations;
//
//   int get id => _id;
//   String get addedBy => _addedBy;
//   int get userId => _userId;
//   String get name => _name;
//   String get slug => _slug;
//   List<CategoryIds> get categoryIds => _categoryIds;
//   int get brandId => _brandId;
//   String get unit => _unit;
//   int get minQty => _minQty;
//   int get refundable => _refundable;
//   dynamic get images => _images;
//   String get thumbnail => _thumbnail;
//   dynamic get featured => _featured;
//   dynamic get flashDeal => _flashDeal;
//   String get videoProvider => _videoProvider;
//   dynamic get videoUrl => _videoUrl;
//   List<dynamic> get colors => _colors;
//   int get variantProduct => _variantProduct;
//   List<dynamic> get attributes => _attributes;
//   List<dynamic> get choiceOptions => _choiceOptions;
//   List<dynamic> get variation => _variation;
//   int get published => _published;
//   int get unitPrice => _unitPrice;
//   int get purchasePrice => _purchasePrice;
//   int get tax => _tax;
//   String get taxType => _taxType;
//   int get discount => _discount;
//   String get discountType => _discountType;
//   int get currentStock => _currentStock;
//   String get details => _details;
//   int get freeShipping => _freeShipping;
//   dynamic get attachment => _attachment;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   int get status => _status;
//   int get featuredStatus => _featuredStatus;
//   dynamic get metaTitle => _metaTitle;
//   dynamic get metaDescription => _metaDescription;
//   String get metaImage => _metaImage;
//   int get requestStatus => _requestStatus;
//   dynamic get deniedNote => _deniedNote;
//   int get shippingCost => _shippingCost;
//   int get multiplyQty => _multiplyQty;
//   dynamic get tempShippingCost => _tempShippingCost;
//   dynamic get isShippingCostUpdated => _isShippingCostUpdated;
//   String get parcode => _parcode;
//   String get largeUnit => _largeUnit;
//   String get largeUnitParcode => _largeUnitParcode;
//   int get largeUnitQuantity => _largeUnitQuantity;
//   String get largeUnitPrice => _largeUnitPrice;
//   int get reviewsCount => _reviewsCount;
//   int get quantityFromPc => _quantityFromPc;
//   List<dynamic> get reviews => _reviews;
//   List<dynamic> get translations => _translations;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['added_by'] = _addedBy;
//     map['user_id'] = _userId;
//     map['name'] = _name;
//     map['slug'] = _slug;
//     if (_categoryIds != null) {
//       map['category_ids'] = _categoryIds.map((v) => v.toJson()).toList();
//     }
//     map['brand_id'] = _brandId;
//     map['unit'] = _unit;
//     map['min_qty'] = _minQty;
//     map['refundable'] = _refundable;
//     map['images'] = _images;
//     map['thumbnail'] = _thumbnail;
//     map['featured'] = _featured;
//     map['flash_deal'] = _flashDeal;
//     map['video_provider'] = _videoProvider;
//     map['video_url'] = _videoUrl;
//     if (_colors != null) {
//       map['colors'] = _colors.map((v) => v.toJson()).toList();
//     }
//     map['variant_product'] = _variantProduct;
//     if (_attributes != null) {
//       map['attributes'] = _attributes.map((v) => v.toJson()).toList();
//     }
//     if (_choiceOptions != null) {
//       map['choice_options'] = _choiceOptions.map((v) => v.toJson()).toList();
//     }
//     if (_variation != null) {
//       map['variation'] = _variation.map((v) => v.toJson()).toList();
//     }
//     map['published'] = _published;
//     map['unit_price'] = _unitPrice;
//     map['purchase_price'] = _purchasePrice;
//     map['tax'] = _tax;
//     map['tax_type'] = _taxType;
//     map['discount'] = _discount;
//     map['discount_type'] = _discountType;
//     map['current_stock'] = _currentStock;
//     map['details'] = _details;
//     map['free_shipping'] = _freeShipping;
//     map['attachment'] = _attachment;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['status'] = _status;
//     map['featured_status'] = _featuredStatus;
//     map['meta_title'] = _metaTitle;
//     map['meta_description'] = _metaDescription;
//     map['meta_image'] = _metaImage;
//     map['request_status'] = _requestStatus;
//     map['denied_note'] = _deniedNote;
//     map['shipping_cost'] = _shippingCost;
//     map['multiply_qty'] = _multiplyQty;
//     map['temp_shipping_cost'] = _tempShippingCost;
//     map['is_shipping_cost_updated'] = _isShippingCostUpdated;
//     map['parcode'] = _parcode;
//     map['large_unit'] = _largeUnit;
//     map['large_unit_parcode'] = _largeUnitParcode;
//     map['large_unit_quantity'] = _largeUnitQuantity;
//     map['large_unit_price'] = _largeUnitPrice;
//     map['reviews_count'] = _reviewsCount;
//     map['quantity_from_pc'] = _quantityFromPc;
//     if (_reviews != null) {
//       map['reviews'] = _reviews.map((v) => v.toJson()).toList();
//     }
//     if (_translations != null) {
//       map['translations'] = _translations.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : "2"
// /// position : 1
//
// class CategoryIds {
//   CategoryIds({
//       String id,
//       int position,}){
//     _id = id;
//     _position = position;
// }
//
//   CategoryIds.fromJson(dynamic json) {
//     _id = Parser.parseString(json['id']);
//     _position = Parser.parseString(json['position']);
//   }
//   String _id;
//   int _position;
//
//   String get id => _id;
//   int get position => _position;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['position'] = _position;
//     return map;
//   }
//
// }