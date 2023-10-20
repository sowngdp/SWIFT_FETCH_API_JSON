//
//  WebServices.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import Foundation


class WebServices

{
    let baseURL = "https://provinces.open-api.vn/api/d/"
    static let shared = WebServices()
    
    
    
    func callAPI() -> [Dictrict]{
        let url = URL(string: baseURL)
        var objected: [Dictrict]?
        
        
        let task = URLSession.shared.dataTask(with: url!){
            data, response, error in
            
            if let data = data {
                do {
                    
//                    let object = try JSONDecoder().decode([Dictrict].self, from: data)
                    let object = try JSONDecoder().decode([Dictrict].self, from: data)
                    print("success")
                    print(object)
                    objected = object
                    
                } catch  {
                    print("error")
                }
            }
        }
        
        task.resume()
        
        return objected!
    }
}


