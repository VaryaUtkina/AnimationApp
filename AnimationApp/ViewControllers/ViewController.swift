//
//  ViewController.swift
//  AnimationApp
//
//  Created by Варвара Уткина on 26.01.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    @IBOutlet var springView: SpringView!
    @IBOutlet var descriptionLabel: UILabel!
    
    private let animationOptions = DataStore()
    private var animations = [
        SpringOption(
            animation: "squeezeUp",
            curve: "easeOut",
            force: 1.24,
            duration: 0.82,
            delay: 0.3
        ),
        SpringOption(
            animation: "squeezeUp",
            curve: "easeOut",
            force: 1.24,
            duration: 0.82,
            delay: 0.3
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springView.layer.cornerRadius = 20
        
        renameLabel(
            preset: animations.first?.animation ?? "squeezeUp",
            curve: animations.first?.curve ?? "easeOut",
            force: animations.first?.force ?? 1,
            duration: animations.first?.duration ?? 1,
            delay: animations.first?.delay ?? 1
        )
    }

    @IBAction func runButtonTapped(_ sender: UIButton) {
        animations.removeFirst()
        animations.insert(
            SpringOption(
                animation: animationOptions.animationTypes.randomElement() ?? "squeezeUp",
                curve: animationOptions.curveTypes.randomElement() ?? "easeOut",
                force: Double.random(in: 1...2),
                duration: Double.random(in: 0...1),
                delay: Double.random(in: 0...1)
            ),
            at: 1
        )
        
        setupRandomAnimation(
            preset: animations.first?.animation ?? "squeezeUp",
            curve: animations.first?.curve ?? "easeOut",
            force: animations.first?.force ?? 1,
            duration: animations.first?.duration ?? 1,
            delay: animations.first?.delay ?? 1
        )
        
        sender.setTitle(
            "Run \(animations.last?.animation ?? "squeezeUp")",
            for: .normal
        )
    }
}

// MARK: - Private methods
private extension ViewController {
    func setupRandomAnimation(
        preset: String,
        curve: String,
        force: Double,
        duration: Double,
        delay: Double
    ) {
        springView.animation = preset
        springView.curve = curve
        springView.force = force
        springView.duration = duration
        springView.delay = delay
        
        springView.animate()
        
        renameLabel(
            preset: preset,
            curve: curve,
            force: force,
            duration: duration,
            delay: delay
        )
    }
    
    func renameLabel(
        preset: String,
        curve: String,
        force: Double,
        duration: Double,
        delay: Double
    ){
        descriptionLabel.text = """
        preset: \(preset)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        delay: \(String(format: "%.2f", delay))
        """
    }
}
