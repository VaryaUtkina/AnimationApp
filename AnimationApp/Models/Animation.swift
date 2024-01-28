//
//  SpringOption.swift
//  AnimationApp
//
//  Created by Варвара Уткина on 26.01.2024.
//

import Foundation

struct Animation: CustomStringConvertible {
    
    let name: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        preset: \(name)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        delay: \(String(format: "%.2f", delay))
        """
    }
    
    static var randomAnimation: Animation {
        Animation(
            name: DataStore.shared.animationTypes.randomElement()?.rawValue ?? "wobble",
            curve: DataStore.shared.curveTypes.randomElement()?.rawValue ?? "easeIn",
            force: Double.random(in: 1...1.5),
            duration: Double.random(in: 0.8...1.6),
            delay: 1
        )
    }
}
