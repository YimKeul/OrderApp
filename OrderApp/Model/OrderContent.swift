//
//  OrderContent.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/24.
//

import Foundation

struct OrderContent : Hashable , Encodable , Decodable {
    let name : String
    let totalPrice : String
    
}
