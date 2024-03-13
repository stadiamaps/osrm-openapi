//
// TripWaypoint.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct TripWaypoint: Codable, Hashable {
    public var name: String?
    public var location: [Double]?
    public var distance: Double?
    public var hint: String?
    public var tripsIndex: Int?
    public var waypointIndex: Int?

    public init(name: String? = nil, location: [Double]? = nil, distance: Double? = nil, hint: String? = nil, tripsIndex: Int? = nil, waypointIndex: Int? = nil) {
        self.name = name
        self.location = location
        self.distance = distance
        self.hint = hint
        self.tripsIndex = tripsIndex
        self.waypointIndex = waypointIndex
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case location
        case distance
        case hint
        case tripsIndex = "trips_index"
        case waypointIndex = "waypoint_index"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(hint, forKey: .hint)
        try container.encodeIfPresent(tripsIndex, forKey: .tripsIndex)
        try container.encodeIfPresent(waypointIndex, forKey: .waypointIndex)
    }
}
