//
//  MainViewController.swift
//  Colorized App
//
//  Created by Alexey Elfimov on 21.11.2024.
//

import UIKit

protocol ColorSettingsViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.delegate = self
        colorSettingsVC.viewColor = view.backgroundColor
    }
        
}
    
    // MARK: - ColorSettingsViewController
    extension MainViewController: ColorSettingsViewControllerDelegate {
        func setColor(_ color: UIColor) {
            view.backgroundColor = color
        }
    }
    


