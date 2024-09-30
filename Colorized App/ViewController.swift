//
//  ViewController.swift
//  Colorized App
//
//  Created by Alexey Yelfimov on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
        setColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    @IBAction func sliderActions(_ sender: UISlider) {
        
        setColor()
        
        switch sender {
        case redSlider: redLabel.text = string(from: redSlider)
        case greenSlider: greenLabel.text = string(from: greenSlider)
        default: blueLabel.text = string(from: blueSlider)
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(
                redSlider.value),
            green: CGFloat(
                greenSlider.value),
            blue: CGFloat(
                blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        "\(round(slider.value * 100) / 100)"
    }
}
