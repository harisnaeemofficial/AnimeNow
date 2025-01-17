//
//  SettingsView.swift
//  Anime Now!
//
//  Created by ErrorErrorError on 9/8/22.
//  Copyright © 2022. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct SettingsView: View {
    let store: StoreOf<SettingsReducer>

    var body: some View {
        Text("Hello world!")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            store: .init(
                initialState: .init(),
                reducer: SettingsReducer()
            )
        )
    }
}
