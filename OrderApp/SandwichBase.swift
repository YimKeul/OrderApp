//
//  SandwichBase.swift
//  OrderApp
//
//  Created by yimkeul on 2023/02/27.
//

import Foundation

class SandwichBase : ObservableObject {
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("sandwich.data")
    }
    
    static func save(history:[OrderContent], completion :@escaping (Result<Int,Error>)->Void) {
        do {
            let data = try JSONEncoder().encode(history)
            let file = try fileURL()
            try data.write(to: file)
            DispatchQueue.main.async {
                completion(.success((history.count)))
            }
        } catch{
            completion(.failure(error))
        }
    }
    
    static func load(completion : @escaping (Result<[OrderContent],Error>)-> Void){
        DispatchQueue.main.async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let orderHistory = try JSONDecoder().decode([OrderContent].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(orderHistory))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
