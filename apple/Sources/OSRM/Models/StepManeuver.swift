//
// StepManeuver.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct StepManeuver: Codable, Hashable {
    public var location: [Double]?
    public var bearingBefore: Int?
    public var bearingAfter: Int?
    public var type: String?
    public var modifier: String?
    public var exit: Int?

    public init(location: [Double]? = nil, bearingBefore: Int? = nil, bearingAfter: Int? = nil, type: String? = nil, modifier: String? = nil, exit: Int? = nil) {
        self.location = location
        self.bearingBefore = bearingBefore
        self.bearingAfter = bearingAfter
        self.type = type
        self.modifier = modifier
        self.exit = exit
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case location
        case bearingBefore = "bearing_before"
        case bearingAfter = "bearing_after"
        case type
        case modifier
        case exit
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(bearingBefore, forKey: .bearingBefore)
        try container.encodeIfPresent(bearingAfter, forKey: .bearingAfter)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(modifier, forKey: .modifier)
        try container.encodeIfPresent(exit, forKey: .exit)
    }
}
