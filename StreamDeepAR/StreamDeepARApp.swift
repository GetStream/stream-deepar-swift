//
//  StreamDeepARApp.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 29.08.23.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

@main
struct StreamDeepARApp: App {
    
    @State var streamVideo: StreamVideoUI?
    @StateObject var filtersService = FiltersService()
    
    private func setupStreamVideo(
        with apiKey: String,
        userCredentials: UserCredentials
    ) {
        streamVideo = StreamVideoUI(
            apiKey: apiKey,
            user: userCredentials.user,
            token: userCredentials.token,
            videoConfig: VideoConfig(videoFilters: [filtersService.deepARFilter]),
            tokenProvider: { result in
                // Call your networking service to generate a new token here.
                // When finished, call the result handler with either .success or .failure.
                result(.success(userCredentials.token))
            }
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(filtersService: filtersService)
                .onAppear {
                    setupStreamVideo(with: "mcux5wpckxrz", userCredentials: .demoUser)
                }
        }
    }
}
