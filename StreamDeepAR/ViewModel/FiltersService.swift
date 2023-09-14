//
//  FiltersService.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 14.09.23.
//

import SwiftUI
import StreamVideo
import DeepAR
import CoreImage

class FiltersService: NSObject, ObservableObject {
    
    @Published var filtersActive = false
    @Published var selectedEffect: Effect = Effect.allCases.first!
    
    private var deepAR: DeepAR!
    var deepARFilter: VideoFilter!
    
    override init() {
        super.init()
        
        /// Initialize DeepAR as stated in the docs
        self.deepAR = DeepAR()
        self.deepAR.setLicenseKey("29d03a839deccc7300323bf64af863908d64e7e883285741a47d8cbbb0ebf1e486b5de625f067e94")
        self.deepAR.delegate = self
        
        self.deepAR.changeLiveMode(false)
        print("[DeepAR]: renderingInitialized: \(deepAR.renderingInitialized)")
        
        /// Create the filter for DeepAR and add it to supported filters
        deepARFilter = createDeepARFilter(deepAR: self.deepAR)
    }
    
    func createDeepARFilter(deepAR: DeepAR) -> VideoFilter {
        let deepARVideoFilter = VideoFilter(id: "deep", name: "DeepAR") { [weak self] image in
            let rotatedImage = image.oriented(.right)
            if self?.deepAR.renderingInitialized == false {
                print("[DeepAR]: DeepAR not initialized.")
                
                self?.deepAR.initializeOffscreen(
                    withWidth: Int(rotatedImage.extent.width),
                    height: Int(rotatedImage.extent.height)
                )
                
                print("[DeepAR]: renderingInitialized: \(self?.deepAR.renderingInitialized)")
                
                guard let path = self?.selectedEffect.path else {
                    print("[DeepAR]: Current effect has no path!")
                    
                    return rotatedImage
                }
                self?.deepAR.switchEffect(withSlot: "effect", path: path)
            }
            
            
            let pixelBuffer: CVPixelBuffer = rotatedImage.toCVPixelBuffer()
            self?.deepAR.processFrame(pixelBuffer, mirror: true)
            
            
            return self?.currentProcessedImage ?? rotatedImage
        }
        return deepARVideoFilter
    }
    
    func filterSelected(effect: Effect) {
        guard let path = effect.path else {
            print("Couldn't convert effect to path: \(effect.rawValue)")
            return
        }
        self.deepAR.switchEffect(withSlot: "effect", path: path)
    }
}
