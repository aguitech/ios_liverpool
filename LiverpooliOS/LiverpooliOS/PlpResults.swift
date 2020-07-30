/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PlpResults : Codable {
	let label : String?
	let plpState : PlpState?
	let sortOptions : [SortOptions]?
	let refinementGroups : [RefinementGroups]?
	let records : [Records]?
	let navigation : Navigation?

	enum CodingKeys: String, CodingKey {

		case label = "label"
		case plpState = "plpState"
		case sortOptions = "sortOptions"
		case refinementGroups = "refinementGroups"
		case records = "records"
		case navigation = "navigation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		plpState = try values.decodeIfPresent(PlpState.self, forKey: .plpState)
		sortOptions = try values.decodeIfPresent([SortOptions].self, forKey: .sortOptions)
		refinementGroups = try values.decodeIfPresent([RefinementGroups].self, forKey: .refinementGroups)
		records = try values.decodeIfPresent([Records].self, forKey: .records)
		navigation = try values.decodeIfPresent(Navigation.self, forKey: .navigation)
	}

}