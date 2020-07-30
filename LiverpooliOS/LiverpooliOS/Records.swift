/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Records : Codable {
	let productId : String?
	let skuRepositoryId : String?
	let productDisplayName : String?
	let productType : String?
	let productRatingCount : Int?
	let productAvgRating : Double?
	let listPrice : Double?
	let minimumListPrice : Double?
	let maximumListPrice : Double?
	let promoPrice : Double?
	let minimumPromoPrice : Double?
	let maximumPromoPrice : Double?
	let isHybrid : Bool?
	let isMarketPlace : Bool?
	let isImportationProduct : Bool?
	let brand : String?
	let seller : String?
	let category : String?
	let smImage : String?
	let lgImage : String?
	let xlImage : String?
	let groupType : String?
	let plpFlags : [String]?
	let variantsColor : [VariantsColor]?

	enum CodingKeys: String, CodingKey {

		case productId = "productId"
		case skuRepositoryId = "skuRepositoryId"
		case productDisplayName = "productDisplayName"
		case productType = "productType"
		case productRatingCount = "productRatingCount"
		case productAvgRating = "productAvgRating"
		case listPrice = "listPrice"
		case minimumListPrice = "minimumListPrice"
		case maximumListPrice = "maximumListPrice"
		case promoPrice = "promoPrice"
		case minimumPromoPrice = "minimumPromoPrice"
		case maximumPromoPrice = "maximumPromoPrice"
		case isHybrid = "isHybrid"
		case isMarketPlace = "isMarketPlace"
		case isImportationProduct = "isImportationProduct"
		case brand = "brand"
		case seller = "seller"
		case category = "category"
		case smImage = "smImage"
		case lgImage = "lgImage"
		case xlImage = "xlImage"
		case groupType = "groupType"
		case plpFlags = "plpFlags"
		case variantsColor = "variantsColor"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		productId = try values.decodeIfPresent(String.self, forKey: .productId)
		skuRepositoryId = try values.decodeIfPresent(String.self, forKey: .skuRepositoryId)
		productDisplayName = try values.decodeIfPresent(String.self, forKey: .productDisplayName)
		productType = try values.decodeIfPresent(String.self, forKey: .productType)
		productRatingCount = try values.decodeIfPresent(Int.self, forKey: .productRatingCount)
		productAvgRating = try values.decodeIfPresent(Double.self, forKey: .productAvgRating)
		listPrice = try values.decodeIfPresent(Double.self, forKey: .listPrice)
		minimumListPrice = try values.decodeIfPresent(Double.self, forKey: .minimumListPrice)
		maximumListPrice = try values.decodeIfPresent(Double.self, forKey: .maximumListPrice)
		promoPrice = try values.decodeIfPresent(Double.self, forKey: .promoPrice)
		minimumPromoPrice = try values.decodeIfPresent(Double.self, forKey: .minimumPromoPrice)
		maximumPromoPrice = try values.decodeIfPresent(Double.self, forKey: .maximumPromoPrice)
		isHybrid = try values.decodeIfPresent(Bool.self, forKey: .isHybrid)
		isMarketPlace = try values.decodeIfPresent(Bool.self, forKey: .isMarketPlace)
		isImportationProduct = try values.decodeIfPresent(Bool.self, forKey: .isImportationProduct)
		brand = try values.decodeIfPresent(String.self, forKey: .brand)
		seller = try values.decodeIfPresent(String.self, forKey: .seller)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		smImage = try values.decodeIfPresent(String.self, forKey: .smImage)
		lgImage = try values.decodeIfPresent(String.self, forKey: .lgImage)
		xlImage = try values.decodeIfPresent(String.self, forKey: .xlImage)
		groupType = try values.decodeIfPresent(String.self, forKey: .groupType)
		plpFlags = try values.decodeIfPresent([String].self, forKey: .plpFlags)
		variantsColor = try values.decodeIfPresent([VariantsColor].self, forKey: .variantsColor)
	}

}