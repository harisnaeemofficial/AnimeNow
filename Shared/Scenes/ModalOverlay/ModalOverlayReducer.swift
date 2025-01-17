////  ModalOverlayReducer.swift
//  Anime Now! (iOS)
//
//  Created by ErrorErrorError on 11/20/22.
//  
//

import Foundation
import ComposableArchitecture

struct ModalOverlayReducer: ReducerProtocol {
    enum State: Equatable {
        case addNewCollection(AddNewCollectionReducer.State)
        case downloadOptions(DownloadOptionsReducer.State)
    }

    enum Action: Equatable {
        case addNewCollection(AddNewCollectionReducer.Action)
        case downloadOptions(DownloadOptionsReducer.Action)
        case onClose
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce(self.core)
            .ifCaseLet(/State.addNewCollection, action: /Action.addNewCollection) {
                AddNewCollectionReducer()
            }
            .ifCaseLet(/State.downloadOptions, action: /Action.downloadOptions) {
                DownloadOptionsReducer()
            }
    }

    func core(_ state: inout State, _ action: Action) -> EffectTask<Action> {
        return .none
    }
}
