//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Asadullah Behlim on 06/04/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>( file: String) -> T {
        
        // 1. Locate Json File
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
            
        }
        
        
        // 2. create a property for the data
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle")
        }
        
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4.  Create a property for the decoded data
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in bundle")
            
        }
        
        // 5. Return the ready to use data
        
        return loaded
        
        
        
    }
}
