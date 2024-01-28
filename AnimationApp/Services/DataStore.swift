//
//  DataStore.swift
//  AnimationApp
//
//  Created by Варвара Уткина on 26.01.2024.
//

import Foundation
import SpringAnimation

final class DataStore {
    static let shared = DataStore()
    
    let animationTypes = AnimationPreset.allCases
    let curveTypes = AnimationCurve.allCases
    
    private init() {}
}
