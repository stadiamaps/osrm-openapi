//
// VoiceInstruction.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
    import AnyCodable
#endif

public struct VoiceInstruction: Codable, Hashable {
    /** How far (in meters) from the upcoming maneuver the instruction should be announced. */
    public var distanceAlongGeometry: Double
    /** The plain-text announcement. */
    public var announcement: String
    /** The announcement in Speech Synthesis Markup Language (SSML). Supported TTS engines include Amazon Polly and Apple's AVSpeechSynthesizer. */
    public var ssmlAnnouncement: String?

    public init(distanceAlongGeometry: Double, announcement: String, ssmlAnnouncement: String? = nil) {
        self.distanceAlongGeometry = distanceAlongGeometry
        self.announcement = announcement
        self.ssmlAnnouncement = ssmlAnnouncement
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case distanceAlongGeometry
        case announcement
        case ssmlAnnouncement
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(distanceAlongGeometry, forKey: .distanceAlongGeometry)
        try container.encode(announcement, forKey: .announcement)
        try container.encodeIfPresent(ssmlAnnouncement, forKey: .ssmlAnnouncement)
    }
}
