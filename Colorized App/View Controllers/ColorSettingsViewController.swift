//
//  ViewController.swift
//  Colorized App
//
//  Created by Alexey Yelfimov on 27.09.2024.
//

import UIKit

final class ColorSettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var deligate: ColorSettingsViewControllerDeligate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        colorView.backgroundColor = viewColor
        
        // MARK: - Setting The Initial Values
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for:)
        
        
        setColor()
        
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - User Login Processing
    @IBAction func sliderActions(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: redLabel.text = string(from: redSlider)
        case greenSlider: greenLabel.text = string(from: greenSlider)
        default: blueLabel.text = string(from: blueSlider)
        }
    }
    
    // MARK: - Methods For Setting Values
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in switch label {
        case redLabel: label.text = string(from: redSlider)
        case greenLabel: label.text = string(from: greenSlider)
        default: label.text = string(from: blueSlider)
        }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        var ciColor = CIColor(color: viewColor)
        colorSliders.forEach {slider in switch slider {
        case redSlider: redSlider.value = Float(ciColor.red)
        case greenSlider: greenSlider.value = Float(ciColor.green)
        default: blueSlider: blueSlider.value = Float(ciColor.blue)
        }
        }
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        
    }
    
    private func string(from slider: UISlider) -> String {
        "\(round(slider.value * 100) / 100)"
    }
    
    @IBAction func doneButtonPressedAction() {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}





