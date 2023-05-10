//
//  Song.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 22.04.2023.
//

import Foundation

// MARK: - Song
struct Song: Codable {
    let tracks: Tracks
}

// MARK: - Tracks
struct Tracks: Codable {
    let track: [Track]
    let attr: TracksAttr

    enum CodingKeys: String, CodingKey {
        case track
        case attr = "@attr"
    }
}

// MARK: - TracksAttr
struct TracksAttr: Codable {
    let tag, page, perPage, totalPages: String
    let total: String
}

// MARK: - Track
struct Track: Codable, Hashable {
    let name, duration, mbid: String
    let url: String
    let streamable: Streamable
    let artist: Artist
    let image: [ImageTrack]
    let attr: TrackAttr

    enum CodingKeys: String, CodingKey {
        case name, duration, mbid, url, streamable, artist, image
        case attr = "@attr"
    }
    
    static func == (lhs: Track, rhs: Track) -> Bool {
                return lhs.mbid == rhs.mbid
            
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(mbid)
    }
}

// MARK: - Artist
struct Artist: Codable {
    let name, mbid: String
    let url: String
}

// MARK: - TrackAttr
struct TrackAttr: Codable {
    let rank: String
}

// MARK: - Image
struct ImageTrack: Codable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

// MARK: - Streamable
struct Streamable: Codable {
    let text, fulltrack: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case fulltrack
    }
}




