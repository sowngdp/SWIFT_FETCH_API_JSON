//
//  DATA.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import Foundation
struct Province: Codable {
    
    
    var name: String?
    var code: Int?
    var division_type: String?
    
}

struct Dictrict: Codable {
    
    var name: String?
    var provinces_code: Int?
    var type_districts: String?
    var code: Int?
    
}
