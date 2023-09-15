//
//  Effect.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 14.09.23.
//

import Foundation

enum Effect: String, CaseIterable {
    case VikingHelmet = "viking_helmet"
    case MakeupLook = "MakeupLook"
    case SplitViewLook = "Split_View_Look"
    case EmotionsExaggerator = "Emotions_Exaggerator"
    case EmotionMeter = "Emotion_Meter"
    case Stallone = "Stallone"
    case FlowerFace = "flower_face"
    case GalaxyBackground = "galaxy_background"
    case Humanoid = "Humanoid"
    case NeonDevilHorns = "Neon_Devil_Horns"
    case PingPong = "Ping_Pong"
    case PixelHearts = "Pixel_Hearts"
    case Snail = "Snail"
    case Hope = "Hope"
    case VendettaMask = "Vendetta_Mask"
    case FireEffect = "Fire_Effect"
    case BurningEffect = "burning_effect"
    case ElephantTrunk = "Elephant_Trunk"
    
    var path: String? {
        return Bundle.main.path(forResource: self.rawValue, ofType: "deepar")
    }
    
    var name: String {
        switch self {
        case .VikingHelmet:
            return "Viking"
        case .MakeupLook:
            return "Makeup"
        case .SplitViewLook:
            return "Split View"
        case .EmotionsExaggerator:
            return "Emotions"
        case .EmotionMeter:
            return "Meter"
        case .Stallone:
            return "Stallone"
        case .FlowerFace:
            return "Flowers"
        case .GalaxyBackground:
            return "Galaxy"
        case .Humanoid:
            return "Humanoid"
        case .NeonDevilHorns:
            return "Horns"
        case .PingPong:
            return "PingPong"
        case .PixelHearts:
            return "Pixel Hearts"
        case .Snail:
            return "Snail"
        case .Hope:
            return "Hope"
        case .VendettaMask:
            return "Vendetta"
        case .FireEffect:
            return "Fire"
        case .BurningEffect:
            return "Burning"
        case .ElephantTrunk:
            return "Elephant"
        }
    }
}
