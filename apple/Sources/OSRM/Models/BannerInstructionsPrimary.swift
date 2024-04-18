//
// BannerInstructionsPrimary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct BannerInstructionsPrimary: Codable, Hashable {
    public var text: String?
    public var type: String?
    public var modifier: String?
    public var components: [BannerInstructionsPrimaryComponentsInner]?

    public init(text: String? = nil, type: String? = nil, modifier: String? = nil, components: [BannerInstructionsPrimaryComponentsInner]? = nil) {
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
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(modifier, forKey: .modifier)
        try container.encodeIfPresent(components, forKey: .components)
    }
}
