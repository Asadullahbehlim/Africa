//
//  VideoModel.swift
//  Africa
//
//  Created by Asadullah Behlim on 10/04/22.
//

import Foundation
import SwiftUI

struct Video : Codable, Identifiable
{
    let id : String
    let name : String
    let headline : String
    
    var thumbnail: String {
        ("video-\(id)")
    }
}
