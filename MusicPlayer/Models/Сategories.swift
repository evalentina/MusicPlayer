//
//  Сфеупщкшуы.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 01.05.2023.
//

import Foundation

// MARK: - Сategories
struct Сategories: Codable {
    let tags: Tags
}

// MARK: - Tags
struct Tags: Codable {
    let tag: [Tag]
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case tag
        case attr = "@attr"
    }
}

// MARK: - Attr
struct Attr: Codable {
    let page, perPage, totalPages, total: String
}

// MARK: - Tag
struct Tag: Codable, Hashable {
    let name: String
    let url: String
    let reach, taggings, streamable: String
    let wiki: Wiki
    static func == (lhs: Tag, rhs: Tag) -> Bool {
                return lhs.name == rhs.name
            
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

// MARK: - Wiki
struct Wiki: Codable {
}

