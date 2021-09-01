//
//  DeleteActionRequest.swift
//  Multipart-Moya
//
//  Created by SHIN YOON AH on 2021/09/01.
//

import Foundation

struct DeleteActionRequest: Codable {
    var characterIndex: Int
    var activityIndex: Int
    
    init(_ characterIndex: Int, _ activityIndex: Int) {
        self.characterIndex = characterIndex
        self.activityIndex = activityIndex
    }
}
