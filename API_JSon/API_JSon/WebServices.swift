//
//  WebServices.swift
//  API_JSon
//
//  Created by Fy Spoti on 20/10/2023.
//

import Foundation


class WebServices

{
    let baseProvincesURL = "https://provinces.open-api.vn/api/p/"
    let baseDistrictsURL = "https://provinces.open-api.vn/api/d/"
    static let shared = WebServices()
    
    
    
    func callAPIProvinces(completion: @escaping ([Province]?) -> Void) {
            if let url = URL(string: baseProvincesURL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let provinces = try JSONDecoder().decode([Province].self, from: data)
                            completion(provinces)
                        } catch {
                            print("Error: (error)")
                            completion(nil)
                        }
                    } else {
                        print("Error: Data is nil")
                        completion(nil)
                    }
                }.resume()
            } else {
                print("Error: Invalid URL")
                completion(nil)
            }
        }
    
    func callAPIDistricts(completion: @escaping ([District]?) -> Void) {
            if let url = URL(string: baseDistrictsURL) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let districts = try JSONDecoder().decode([District].self, from: data)
                            completion(districts)
                        } catch {
                            print("Error: (error)")
                            completion(nil)
                        }
                    } else {
                        print("Error: Data is nil")
                        completion(nil)
                    }
                }.resume()
            } else {
                print("Error: Invalid URL")
                completion(nil)
            }
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
