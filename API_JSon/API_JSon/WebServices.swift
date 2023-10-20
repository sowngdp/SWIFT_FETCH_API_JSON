//
//  WebServices.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import Foundation


class WebServices

{
    let baseURL = "https://provinces.open-api.vn/api/p/"
    static let shared = WebServices()
    
    
    
    func callAPI(){
        let url = URL(string: baseURL)
        
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    // Thực hiện giải mã dữ liệu JSON thành các đối tượng
                    let provine = try decoder.decode([Province].self, from: data)
                    // Bây giờ bạn có một mảng các đối tượng Tinh
                    print(provine[1].name!)
                } catch {
                    print("Lỗi khi giải mã JSON: \(error)")
                }
            } else if let error = error {
                print("Lỗi khi tải dữ liệu: \(error)")
            }
        }
        task.resume()
        
    }
}


/*
 if let url = URL(string: "https://provinces.open-api.vn/api/d/") {
     let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
         if let data = data {
             do {
                 let decoder = JSONDecoder()
                 // Thực hiện giải mã dữ liệu JSON thành các đối tượng
                 let tinhData = try decoder.decode([Tinh].self, from: data)
                 // Bây giờ bạn có một mảng các đối tượng Tinh
                 print(tinhData)
             } catch {
                 print("Lỗi khi giải mã JSON: \(error)")
             }
         } else if let error = error {
             print("Lỗi khi tải dữ liệu: \(error)")
         }
     }
     task.resume()
 }
 */
