//
//  MainViewController.swift
//  Colorized App
//
//  Created by Alexey Elfimov on 21.11.2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSettingsVC = segue.destination as? SettingsViewController
        colorSettingsVC?.delegate = self
        colorSettingsVC?.viewColor = view.backgroundColor
    }
        
}
    
    // MARK: - ColorSettingsViewController
    extension MainViewController: SettingsViewControllerDelegate {
        func setColor(_ color: UIColor) {
            view.backgroundColor = color
        }
    }
    


