import Foundation

struct Books: Decodable {
    let items: [BookItem]
}

struct BookItem: Decodable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String
    let author: String
    let publisher: String
    let publishedDate: String
    let description: String
    let pageCount: Int
    let categories: [String]
    let language: String
    let previewLink: String
}
