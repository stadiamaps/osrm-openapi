//
// Intersection.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct Intersection: Codable, Hashable {
    public var location: [Double]?
    public var bearings: [Int]?
    public var classes: [String]?
    public var entry: [Bool]?
    public var _in: Int?
    public var out: Int?
    public var lanes: [Lane]?

    public init(location: [Double]? = nil, bearings: [Int]? = nil, classes: [String]? = nil, entry: [Bool]? = nil, _in: Int? = nil, out: Int? = nil, lanes: [Lane]? = nil) {
        self.location = location
        self.bearings = bearings
        self.classes = classes
        self.entry = entry
        self._in = _in
        self.out = out
        self.lanes = lanes
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case bearings
        case classes
        case entry
        case _in = "in"
        case out
        case lanes
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(bearings, forKey: .bearings)
        try container.encodeIfPresent(classes, forKey: .classes)
        try container.encodeIfPresent(entry, forKey: .entry)
        try container.encodeIfPresent(_in, forKey: ._in)
        try container.encodeIfPresent(out, forKey: .out)
        try container.encodeIfPresent(lanes, forKey: .lanes)
    }
}
