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
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = animation.description
        }
    }
    
    private var animation = Animation.randomAnimation

    @IBAction func runButtonTapped(_ sender: UIButton) {
        springView.animation = "zoomOut"
        springView.x = 50
        springView.animate()
        descriptionLabel.text = animation.description
        
        springView.animateNext { [ unowned self ] in
            springView.animation = "zoomOut"
            springView.animate()
            
            springView.animation = animation.name
            springView.curve = animation.curve
            springView.duration = animation.duration
            springView.force = animation.force
            springView.delay = animation.delay
            springView.animate()
            
            animation = Animation.randomAnimation
            sender.setTitle("Run \(animation.name)", for: .normal)
        }
    }
}
