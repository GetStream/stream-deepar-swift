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
}
