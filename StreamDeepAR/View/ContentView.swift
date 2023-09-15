//
//  ContentView.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 29.08.23.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct ContentView: View {
    
    @Injected(\.streamVideo) var streamVideo
    
    @ObservedObject var filtersService: FiltersService
    
    @StateObject var callViewModel = CallViewModel()
    @State var callId = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                TextField("Insert a call id", text: $callId)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button {
                    resignFirstResponder()
                    callViewModel.startCall(
                        callType: "default",
                        callId: callId,
                        members: [/* Your list of participants goes here. */]
                    )
                } label: {
                    Text("Start a call")
                }
            }
            .padding()
            .modifier(CallModifier(viewModel: callViewModel))
            
            if callViewModel.callingState == .inCall {
                FiltersPicker(
                    viewModel: callViewModel,
                    filtersService: filtersService
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(filtersService: FiltersService())
    }
}
