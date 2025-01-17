//
//  SkipTime.swift
//  Anime Now!
//
//  Created by ErrorErrorError on 10/11/22.
//

import Foundation

struct SkipTime: Hashable {
    let startTime: Double   // 0...1
    let endTime: Double     // 0...1
    let type: Option

    enum Option: Hashable {
        case recap
        case opening
        case ending
        case mixedOpening
        case mixedEnding
    }

    func isInRange(_ progress: Double) -> Bool {
        startTime <= progress && progress <= endTime
    }
}

