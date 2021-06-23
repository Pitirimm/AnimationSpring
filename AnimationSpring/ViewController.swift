//
//  ViewController.swift
//  AnimationSpring
//
//  Created by Yuriy Martinovskiy on 22.06.2021.
//

import UIKit
import Spring

class ViewController: UIViewController {
    @IBOutlet weak var viewSpring: SpringView!
    @IBOutlet weak var buttonSpring: SpringButton!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var viewNextLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    let animation = ["shake", "pop", "morph", "squeeze", "wobble", "swing", "flipX", "flipY", "fall", "squeezeLeft", "squeezeRight", "squeezeDown", "squeezeUp"]
    let curve = ["spring", "linear", "easeIn", "easeOut", "easeInOut"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSpring.layer.cornerRadius = 12
        buttonSpring.layer.cornerRadius = 12
    }
    
    func playAnimation() {
        if index < animation.count {
            viewSpring.animation = animation[index]
            viewSpring.curve = curve.randomElement() ?? "spring"
            viewLabel.text = "Current animation: \(animation[index])"
            settingsLabel.text = "Curve: \(viewSpring.curve)"
            index += 1
           
            if index < animation.count {
                viewNextLabel.text = "Next animation: \(animation[index])"
            } else {
                index = 0
                viewNextLabel.text = "Next animation: \(animation[index])"
            }
            
        } else {
            index = 0
            viewSpring.animation = animation[index]
            viewLabel.text = "Current animation: \(viewSpring.animation)"
        }
    }

    @IBAction func pressedButton(_ sender: SpringButton) {
        buttonSpring.animation = "pop"
        playAnimation()
        viewSpring.animate()
        buttonSpring.animate()
    }
    
}
