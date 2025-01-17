//  SettingsRowView.swift
//  Anime Now!
//
//  Created by ErrorErrorError on 11/24/22.
//  
//

import SwiftUI

struct SettingsRowView: View {
    let name: String
    var selected: String? = nil
    var multiSelectionable = false
    var loading = false
    var cornerRadius = 12.0
    var tapped: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text(name)
                .font(.callout.bold())

            Spacer()

            if let selected = selected {
                Text(selected)
                    .font(.footnote.bold())
                    .foregroundColor(multiSelectionable ? Color.white : Color.gray)
            }

            if loading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if multiSelectionable {
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundColor(.gray)
                }
            }
        }
        .foregroundColor(loading ? Color.gray : Color.white)
        .padding()
        .background(Color(white: 0.2))
        .cornerRadius(cornerRadius)
        .contentShape(Rectangle())
        .onTapGesture {
            if !loading {
                tapped?()
            }
        }
    }
}

extension SettingsRowView {
    func onTapped(_ callback: @escaping () -> Void) -> SettingsRowView {
        var view = self
        view.tapped = callback
        return view
    }

    func cornerRadius(_ cornerRadius: CGFloat) -> SettingsRowView {
        var view = self
        view.cornerRadius = cornerRadius
        return view
    }

    func multiSelectable(_ multi: Bool) -> SettingsRowView {
        var view = self
        view.multiSelectionable = multi
        return view
    }
}

struct SettingsRowView_Previes: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Test")
    }
}
