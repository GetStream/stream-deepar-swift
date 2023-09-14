//
//  FiltersPicker.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 14.09.23.
//

import SwiftUI
import StreamVideoSwiftUI

struct FiltersPicker: View {
    
    @ObservedObject var viewModel: CallViewModel
    @ObservedObject var filtersService: FiltersService
    
    var body: some View {
        HStack {
            Toggle("Apply filter", isOn: $filtersService.filtersActive)
                .onChange(of: filtersService.filtersActive, perform: { newValue in
                    if newValue {
                        viewModel.setVideoFilter(filtersService.deepARFilter)
                    } else {
                        viewModel.setVideoFilter(nil)
                    }
                })
                .frame(width: 150)
            
            
            Spacer()
            
            if filtersService.filtersActive {
                Picker("Select a filter", selection: $filtersService.selectedEffect) {
                    ForEach(Effect.allCases, id: \.self) { effect in
                        Text(effect.rawValue)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: filtersService.selectedEffect) { newEffect in
                    filtersService.filterSelected(effect: newEffect)
                }
            }
        }
        .padding()
        .background(
            .thinMaterial,
            in: RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        .padding(.horizontal)
    }
}

struct FiltersPicker_Previews: PreviewProvider {
    static var previews: some View {
        FiltersPicker(
            viewModel: CallViewModel(),
            filtersService: FiltersService()
        )
    }
}
