import 'dart:convert';

import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class ProductModel {
  int _totalSize;
  int _limit;
  int _offset;
  List<Product> _products;

  ProductModel({int totalSize, int limit, int offset, List<Product> products}) {
    this._totalSize = totalSize;
    this._limit = limit;
    this._offset = offset;
    this._products = products;
  }

  int get totalSize => _totalSize;

  int get limit => _limit;

  int get offset => _offset;

  List<Product> get products => _products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _totalSize = Parser.parseInt(json['total_size']);
    _limit = Parser.parseInt(json['limit']);
    _offset = Parser.parseInt(json['offset']);
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this._totalSize;
    data['limit'] = this._limit;
    data['offset'] = this._offset;
    if (this._products != null) {
      data['products'] = this._products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Product {
//   Product({
//     int id,
//     String addedBy,
//     int userId,
//     String name,
//     String slug,
//     List<CategoryIds> categoryIds,
//     int brandId,
//     String unit,
//     int minQty,
//     int refundable,
//     dynamic images,
//     String thumbnail,
//     dynamic featured,
//     dynamic flashDeal,
//     String videoProvider,
//     dynamic videoUrl,
//     List<dynamic> colors,
//     int variantProduct,
//     List<dynamic> attributes,
//     List<ChoiceOptions> choiceOptions,
//     List<Variation> variation,
//     int published,
//     int unitPrice,
//     int purchasePrice,
//     int tax,
//     String taxType,
//     int discount,
//     String discountType,
//     int currentStock,
//     String details,
//     int freeShipping,
//     dynamic attachment,
//     String createdAt,
//     String updatedAt,
//     int status,
//     int featuredStatus,
//     dynamic metaTitle,
//     dynamic metaDescription,
//     String metaImage,
//     int requestStatus,
//     dynamic deniedNote,
//     int shippingCost,
//     int multiplyQty,
//     dynamic tempShippingCost,
//     dynamic isShippingCostUpdated,
//     String parcode,
//     String largeUnit,
//     String largeUnitParcode,
//     int largeUnitQuantity,
//     String largeUnitPrice,
//     int reviewsCount,
//     int quantityFromPc,
//     List<dynamic> reviews,
//     List<dynamic> translations,
//   }) {
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
//   }
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
//       try {
//         json['colors'].forEach((v) {
//           _colors.add(new ProductColors.fromJson(v));
//         });
//       } catch (e) {
//         jsonDecode(json['colors']).forEach((v) {
//           _colors.add(new ProductColors.fromJson(v));
//         });
//       }
//     }
//     if (json['attributes'] != null) {
//       try {
//         _attributes = json['attributes'].cast<String>();
//       } catch (e) {
//         _attributes = jsonDecode(json['attributes']).cast<String>();
//       }
//     }
//     if (json['choice_options'] != null) {
//       _choiceOptions = [];
//       try {
//         json['choice_options'].forEach((v) {
//           _choiceOptions.add(new ChoiceOptions.fromJson(v));
//         });
//       } catch (e) {
//         jsonDecode(json['choice_options']).forEach((v) {
//           _choiceOptions.add(new ChoiceOptions.fromJson(v));
//         });
//       }
//     }
//     if (json['variation'] != null) {
//       _variation = [];
//       try {
//         json['variation'].forEach((v) {
//           _variation.add(new Variation.fromJson(v));
//         });
//       } catch (e) {
//         jsonDecode(json['variation']).forEach((v) {
//           _variation.add(new Variation.fromJson(v));
//         });
//       }
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
//     _reviews = Parser.parseString(json['reviews']);
//     _translations = Parser.parseString(json['translations']);
//   }
//
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
//
//   String get addedBy => _addedBy;
//
//   int get userId => _userId;
//
//   String get name => _name;
//
//   String get slug => _slug;
//
//   List<CategoryIds> get categoryIds => _categoryIds;
//
//   int get brandId => _brandId;
//
//   String get unit => _unit;
//
//   int get minQty => _minQty;
//
//   int get refundable => _refundable;
//
//   dynamic get images => _images;
//
//   String get thumbnail => _thumbnail;
//
//   dynamic get featured => _featured;
//
//   dynamic get flashDeal => _flashDeal;
//
//   String get videoProvider => _videoProvider;
//
//   dynamic get videoUrl => _videoUrl;
//
//   List<dynamic> get colors => _colors;
//
//   int get variantProduct => _variantProduct;
//
//   List<dynamic> get attributes => _attributes;
//
//   List<dynamic> get choiceOptions => _choiceOptions;
//
//   List<dynamic> get variation => _variation;
//
//   int get published => _published;
//
//   int get unitPrice => _unitPrice;
//
//   int get purchasePrice => _purchasePrice;
//
//   int get tax => _tax;
//
//   String get taxType => _taxType;
//
//   int get discount => _discount;
//
//   String get discountType => _discountType;
//
//   int get currentStock => _currentStock;
//
//   String get details => _details;
//
//   int get freeShipping => _freeShipping;
//
//   dynamic get attachment => _attachment;
//
//   String get createdAt => _createdAt;
//
//   String get updatedAt => _updatedAt;
//
//   int get status => _status;
//
//   int get featuredStatus => _featuredStatus;
//
//   dynamic get metaTitle => _metaTitle;
//
//   dynamic get metaDescription => _metaDescription;
//
//   String get metaImage => _metaImage;
//
//   int get requestStatus => _requestStatus;
//
//   dynamic get deniedNote => _deniedNote;
//
//   int get shippingCost => _shippingCost;
//
//   int get multiplyQty => _multiplyQty;
//
//   dynamic get tempShippingCost => _tempShippingCost;
//
//   dynamic get isShippingCostUpdated => _isShippingCostUpdated;
//
//   String get parcode => _parcode;
//
//   String get largeUnit => _largeUnit;
//
//   String get largeUnitParcode => _largeUnitParcode;
//
//   int get largeUnitQuantity => _largeUnitQuantity;
//
//   String get largeUnitPrice => _largeUnitPrice;
//
//   int get reviewsCount => _reviewsCount;
//
//   int get quantityFromPc => _quantityFromPc;
//
//   List<dynamic> get reviews => _reviews;
//
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
// }
//
// /// id : "2"
// /// position : 1
//
// class CategoryIds {
//   CategoryIds({
//     String id,
//     int position,
//   }) {
//     _id = id;
//     _position = position;
//   }
//
//   CategoryIds.fromJson(dynamic json) {
//     _id = Parser.parseString(json['id']);
//     _position = Parser.parseString(json['position']);
//   }
//
//   String _id;
//   int _position;
//
//   String get id => _id;
//
//   int get position => _position;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['position'] = _position;
//     return map;
//   }
// }

class Product {
  int _id;
  String _addedBy;
  int _userId;
  String _name;
  String _slug;
  List<CategoryIds> _categoryIds;
  String _unit;
  List<String> _images;
  String _thumbnail;
  List<ProductColors> _colors;
  List<String> _attributes;
  List<ChoiceOptions> _choiceOptions;
  List<Variation> _variation;
  double _unitPrice;
  double _purchasePrice;
  double _tax;
  int _minQty;
  String _taxType;
  double _discount;
  String _discountType;
  int _currentStock;
  String _details;
  String _createdAt;
  String _updatedAt;
  List<Rating> _rating;
  double _shippingCost;
  int _isMultiPly;
  int _reviewCount;
  String _parcode;
  String _largeUnit;
  String _largeUnitParcode;
  String _largeUnitQuantity;
  String _largeUnitPrice;
  int _quantityFromPc;

  Product({
    int id,
    String addedBy,
    int userId,
    String name,
    String slug,
    List<CategoryIds> categoryIds,
    String unit,
    int minQty,
    List<String> images,
    String thumbnail,
    List<ProductColors> colors,
    String variantProduct,
    List<String> attributes,
    List<ChoiceOptions> choiceOptions,
    List<Variation> variation,
    double unitPrice,
    double purchasePrice,
    double tax,
    String taxType,
    double discount,
    String discountType,
    int currentStock,
    String details,
    String attachment,
    String createdAt,
    String updatedAt,
    int featuredStatus,
    List<Rating> rating,
    double shippingCost,
    int isMultiPly,
    int reviewCount,
    String parcode,
    String largeUnit,
    String largeUnitParcode,
    String largeUnitQuantity,
    String largeUnitPrice,
    int quantityFromPc,
  }) {
    this._id = id;
    this._addedBy = addedBy;
    this._userId = userId;
    this._name = name;
    this._slug = slug;
    this._categoryIds = categoryIds;
    this._unit = unit;
    this._minQty = minQty;
    this._images = images;
    this._thumbnail = thumbnail;
    this._colors = colors;
    this._attributes = attributes;
    this._choiceOptions = choiceOptions;
    this._variation = variation;
    this._unitPrice = unitPrice;
    this._purchasePrice = purchasePrice;
    this._tax = tax;
    this._taxType = taxType;
    this._discount = discount;
    this._discountType = discountType;
    this._currentStock = currentStock;
    this._details = details;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._rating = rating;
    this._shippingCost = shippingCost;
    this._isMultiPly = isMultiPly;
    this._reviewCount = reviewCount;
    this._largeUnitQuantity = largeUnitQuantity;
    this._parcode = parcode;
    this._quantityFromPc = quantityFromPc;
    this._largeUnitPrice = largeUnitPrice;
    this._largeUnitParcode = largeUnitParcode;
    this._largeUnit = largeUnit;
  }

  int get id => _id;

  String get addedBy => _addedBy;

  int get userId => _userId;

  String get name => _name;

  String get slug => _slug;

  List<CategoryIds> get categoryIds => _categoryIds;

  String get unit => _unit;

  int get minQty => _minQty;

  List<String> get images => _images;

  String get thumbnail => _thumbnail;

  List<ProductColors> get colors => _colors;

  List<String> get attributes => _attributes;

  List<ChoiceOptions> get choiceOptions => _choiceOptions;

  List<Variation> get variation => _variation;

  double get unitPrice => _unitPrice;

  double get purchasePrice => _purchasePrice;

  double get tax => _tax;

  String get taxType => _taxType;

  double get discount => _discount;

  String get discountType => _discountType;

  int get currentStock => _currentStock;

  String get details => _details;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  List<Rating> get rating => _rating;

  double get shippingCost => _shippingCost;

  int get isMultiPly => _isMultiPly;

  int get reviewCount => _reviewCount;

  String get parcode => _parcode;

  String get largeUnit => _largeUnit;

  String get largeUnitParcode => _largeUnitParcode;

  String get largeUnitQuantity => _largeUnitQuantity;

  String get largeUnitPrice => _largeUnitPrice;

  int get quantityFromPc => _quantityFromPc;

  Product.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _addedBy = Parser.parseString(json['added_by']);
    _userId = Parser.parseInt(json['user_id']);
    _name = Parser.parseString(json['name']);
    _slug = Parser.parseString(json['slug']);
    if (json['category_ids'] != null) {
      _categoryIds = [];
      try {
        json['category_ids'].forEach((v) {
          _categoryIds.add(new CategoryIds.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['category_ids']).forEach((v) {
          _categoryIds.add(new CategoryIds.fromJson(v));
        });
      }
    }
    _unit = Parser.parseString(json['unit']);
    _minQty = Parser.parseInt(json['min_qty']);
    if (json['images'] != null) {
      try {
        _images = json['images'] != null ? json['images'].cast<String>() : [];
      } catch (e) {
        _images = json['images'] != null
            ? jsonDecode(json['images']).cast<String>()
            : [];
      }
    }
    //_images = json['images'] != null ? json['images'].cast<String>() : [];
    _thumbnail = Parser.parseString(json['thumbnail']);
    if (json['colors'] != null) {
      _colors = [];
      try {
        json['colors'].forEach((v) {
          _colors.add(new ProductColors.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['colors']).forEach((v) {
          _colors.add(new ProductColors.fromJson(v));
        });
      }
    }
    if (json['attributes'] != null) {
      try {
        _attributes = json['attributes'].cast<String>();
      } catch (e) {
        _attributes = jsonDecode(json['attributes']).cast<String>();
      }
    }
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      try {
        json['choice_options'].forEach((v) {
          _choiceOptions.add(new ChoiceOptions.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['choice_options']).forEach((v) {
          _choiceOptions.add(new ChoiceOptions.fromJson(v));
        });
      }
    }
    if (json['variation'] != null) {
      _variation = [];
      try {
        json['variation'].forEach((v) {
          _variation.add(new Variation.fromJson(v));
        });
      } catch (e) {
        jsonDecode(json['variation']).forEach((v) {
          _variation.add(new Variation.fromJson(v));
        });
      }
    }
    if (json['unit_price'] != null) {
      _unitPrice = json['unit_price'].toDouble();
    }
    if (json['purchase_price'] != null) {
      _purchasePrice = json['purchase_price'].toDouble();
    }

    if (json['tax'] != null) {
      _tax = json['tax'].toDouble();
    }
    _taxType = Parser.parseString(json['tax_type']);
    if (json['discount'] != null) {
      _discount = json['discount'].toDouble();
    }
    _discountType = Parser.parseString(json['discount_type']);
    _currentStock = Parser.parseInt(json['current_stock']);
    _details = Parser.parseString(json['details']);
    _createdAt = Parser.parseString(json['created_at']);
    _updatedAt = Parser.parseString(json['updated_at']);
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating.add(new Rating.fromJson(v));
      });
    } else {}
    if (json['shipping_cost'] != null) {
      _shippingCost = double.parse(json['shipping_cost'].toString());
    }
    if (json['multiply_qty'] != null) {
      _isMultiPly = int.parse(json['multiply_qty'].toString());
    }
    if (json['reviews_count'] != null) {
      _reviewCount = int.parse(json['reviews_count'].toString());
    }
    _parcode = Parser.parseString(json['parcode']);
    _largeUnit = Parser.parseString(json['large_unit']);
    _largeUnitParcode = Parser.parseString(json['large_unit_parcode']);
    _largeUnitQuantity = Parser.parseString(json['large_unit_quantity']);
    _largeUnitPrice = Parser.parseString(json['large_unit_price']);
    _quantityFromPc = Parser.parseInt(json['quantity_from_pc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['added_by'] = this._addedBy;
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    if (this._categoryIds != null) {
      data['category_ids'] = this._categoryIds.map((v) => v.toJson()).toList();
    }
    data['unit'] = this._unit;
    data['min_qty'] = this._minQty;
    data['images'] = this._images;
    data['thumbnail'] = this._thumbnail;
    if (this._colors != null) {
      data['colors'] = this._colors.map((v) => v.toJson()).toList();
    }
    data['attributes'] = this._attributes;
    if (this._choiceOptions != null) {
      data['choice_options'] =
          this._choiceOptions.map((v) => v.toJson()).toList();
    }
    if (this._variation != null) {
      data['variation'] = this._variation.map((v) => v.toJson()).toList();
    }
    data['unit_price'] = this._unitPrice;
    data['purchase_price'] = this._purchasePrice;
    data['tax'] = this._tax;
    data['tax_type'] = this._taxType;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['current_stock'] = this._currentStock;
    data['details'] = this._details;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._rating != null) {
      data['rating'] = this._rating.map((v) => v.toJson()).toList();
    }
    data['shipping_cost'] = this._shippingCost;
    data['multiply_qty'] = this._isMultiPly;
    data['reviews_count'] = this._reviewCount;
    data['parcode'] = _parcode;
    data['large_unit'] = _largeUnit;
    data['large_unit_parcode'] = _largeUnitParcode;
    data['large_unit_quantity'] = _largeUnitQuantity;
    data['large_unit_price'] = _largeUnitPrice;
    data['quantity_from_pc'] = _quantityFromPc;
    return data;
  }
}

class CategoryIds {
  int _position;

  CategoryIds({int position}) {
    this._position = position;
  }

  int get position => _position;

  CategoryIds.fromJson(Map<String, dynamic> json) {
    _position = Parser.parseInt(json['position']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this._position;
    return data;
  }
}

class ProductColors {
  String _name;
  String _code;

  ProductColors({String name, String code}) {
    this._name = name;
    this._code = code;
  }

  String get name => _name;

  String get code => _code;

  ProductColors.fromJson(Map<String, dynamic> json) {
    _name = Parser.parseString(json['name']);
    _code = Parser.parseString(json['code']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['code'] = this._code;
    return data;
  }
}

class ChoiceOptions {
  String _name;
  String _title;
  List<String> _options;

  ChoiceOptions({String name, String title, List<String> options}) {
    this._name = name;
    this._title = title;
    this._options = options;
  }

  String get name => _name;

  String get title => _title;

  List<String> get options => _options;

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    _name = Parser.parseString(json['name']);
    _title = Parser.parseString(json['title']);
    _options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['title'] = this._title;
    data['options'] = this._options;
    return data;
  }
}

class Variation {
  String _type;
  double _price;
  String _sku;
  int _qty;

  Variation({String type, double price, String sku, int qty}) {
    this._type = type;
    this._price = price;
    this._sku = sku;
    this._qty = qty;
  }

  String get type => _type;

  double get price => _price;

  String get sku => _sku;

  int get qty => _qty;

  Variation.fromJson(Map<String, dynamic> json) {
    _type = Parser.parseString(json['type']);
    _price = json['price'].toDouble();
    _sku = Parser.parseString(json['sku']);
    _qty = Parser.parseInt(json['qty']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['price'] = this._price;
    data['sku'] = this._sku;
    data['qty'] = this._qty;
    return data;
  }
}

class Rating {
  String _average;
  int _productId;

  Rating({String average, int productId}) {
    this._average = average;
    this._productId = productId;
  }

  String get average => _average;

  int get productId => _productId;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'].toString();
    _productId = Parser.parseInt(json['product_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this._average;
    data['product_id'] = this._productId;
    return data;
  }
}
