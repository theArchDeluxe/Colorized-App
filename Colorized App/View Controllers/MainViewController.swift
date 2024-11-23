//
//  MainViewController.swift
//  Colorized App
//
//  Created by Alexey Elfimov on 21.11.2024.
//

import UIKit

protocol ColorSettingsViewControllerDeligate: AnyObject {
    func setColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSettingsVC = segue.destination as? ColorSettingsViewController
        colorSettingsVC?.delegate = self
        colorSettingsVC?.viewColor = view.backgroundColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - ColorSettingsViewController
    extension MainViewController: ColorSettingsViewControllerDeligate {
        func setColor(_ color: UIColor) {
            view.backgroundColor = color
        }
    }
    

}
