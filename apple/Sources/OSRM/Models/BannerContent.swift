//
// BannerContent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct BannerContent: Codable, Hashable {
    public enum ModelType: String, Codable, CaseIterable {
        case turn
        case newName = "new name"
        case depart
        case arrive
        case merge
        case onRamp = "on ramp"
        case offRamp = "off ramp"
        case fork
        case endOfRoad = "end of road"
        case _continue = "continue"
        case roundabout
        case rotary
        case roundaboutTurn = "roundabout turn"
        case notification
        case exitRoundabout = "exit roundabout"
        case exitRotary = "exit rotary"
    }

    public var text: String
    public var type: ModelType?
    public var modifier: GuidanceModifier?
    /** A list of objects with additional context that allow for visual layout improvements beyond what's possible with plain text. */
    public var components: [BannerComponent]?

    public init(text: String, type: ModelType? = nil, modifier: GuidanceModifier? = nil, components: [BannerComponent]? = nil) {
        self.text = text
        self.type = type
        self.modifier = modifier
        self.components = components
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case text
        case type
        case modifier
        case components
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(modifier, forKey: .modifier)
        try container.encodeIfPresent(components, forKey: .components)
    }
}
