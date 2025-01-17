//
//  AnimeNowHostingController.swift
//  Anime Now! (iOS)
//
//  Created by ErrorErrorError on 10/9/22.
//

import Foundation
import SwiftUI

class AnimeNowHostingController: UIHostingController<AnyView> {
    override var prefersHomeIndicatorAutoHidden: Bool { homeIndicatorAutoHidden }

    var homeIndicatorAutoHidden = false {
       didSet {
            setNeedsUpdateOfHomeIndicatorAutoHidden()
       }
   }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { interfaceOrientations }

    private var interfaceOrientations = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16, *) {
                UIView.performWithoutAnimation {
                    setNeedsUpdateOfSupportedInterfaceOrientations()
                }
            } else {
                UIView.performWithoutAnimation {
                    if interfaceOrientations.contains(.portrait) {
                        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
                    } else if interfaceOrientations.contains(.landscape) {
                        let orientation: UIDeviceOrientation = UIDevice.current.orientation == .landscapeRight ? .landscapeRight : .landscapeLeft
                        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
                    }
                    UIViewController.attemptRotationToDeviceOrientation()
                }
            }
        }
    }

    override var shouldAutorotate: Bool { true }

    init<V: View>(wrappedView: V) {
        let box = Box()

        super.init(
            rootView:
                AnyView(
                    wrappedView
                        .onPreferenceChange(HomeIndicatorAutoHiddenPreferenceKey.self) { value in
                            box.delegate?.homeIndicatorAutoHidden = value
                        }
                        .onPreferenceChange(SupportedOrientationPreferenceKey.self) { value in
                            box.delegate?.interfaceOrientations = value
                        }
                )
        )

        box.delegate = self
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

private class Box {
    weak var delegate: AnimeNowHostingController?

}

struct HomeIndicatorAutoHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false

    static func reduce(
        value: inout Bool,
        nextValue: () -> Bool
    ) {
        value = nextValue()
    }
}

struct SupportedOrientationPreferenceKey: PreferenceKey {
    static var defaultValue: UIInterfaceOrientationMask = .portrait

    static func reduce(
        value: inout UIInterfaceOrientationMask,
        nextValue: () -> UIInterfaceOrientationMask
    ) {
        value = nextValue()
    }
}

extension View {
    func prefersHomeIndicatorAutoHidden(_ value: Bool) -> some View {
        preference(key: HomeIndicatorAutoHiddenPreferenceKey.self, value: value)
    }

    func supportedOrientation(_ orientation: UIInterfaceOrientationMask) -> some View {
        preference(key: SupportedOrientationPreferenceKey.self, value: orientation)
    }
}

