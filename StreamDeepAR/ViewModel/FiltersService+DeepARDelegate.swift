//
//  FiltersService+DeepARDelegate.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 14.09.23.
//

import Foundation
import DeepAR
import CoreImage

/// The DeepARDelegate which is necessary to conform to
extension FiltersService: DeepARDelegate {
    func faceTracked(_ faceData: MultiFaceData) {}
    
    func faceVisiblityDidChange(_ faceVisible: Bool) {}
    
    func frameAvailable(_ sampleBuffer: CMSampleBuffer!) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("[DeepAR] *** NO BUFFER ERROR")
            return
        }
        
        let image = CIImage(cvPixelBuffer: pixelBuffer)
        let mirror = image.transformed(by: CGAffineTransform(-1, 0, 0, 1, image.extent.width, 0))
        self.currentProcessedImage = mirror.oriented(.left)
    }
    
    func didFinishShutdown() {
        print("Did finish shutdown called.")
    }
    
    func didInitialize() {
        print("Initialized")
    }
}

