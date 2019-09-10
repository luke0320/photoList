//
//  PhotoDataModel.swift
//  PhotoList
//
//  Created by Luke on 2019/9/10.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import Foundation

struct PhotoDataModel: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}


struct FailableDecodable<Base : Codable> : Codable {
    
    let base: Base?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
