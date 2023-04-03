//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Ly Gia Huy on 03/04/2023.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileUrl() throws -> URL {
         try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("scrums", conformingTo: .json)
    }
    
    static func load() async throws -> [DailyScrum]{
        try await withCheckedThrowingContinuation({  continuation in
            load {
               switch $0 {
               case .failure(let error):
                   continuation.resume(throwing: error)
               case .success(let data):
                   continuation.resume(returning: data)
               }
            }
            
        })
    }
    
    static func load(completion: @escaping (Result<[DailyScrum],Error>)->Void){
        DispatchQueue.global(qos: .background).async {
            do {
                let url = try fileUrl()
                guard let file = try? FileHandle(forReadingFrom: url) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int,Error>)->Void){
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileUrl()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch  {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    
    }
}
