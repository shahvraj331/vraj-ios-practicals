//
//  ArchitectureViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 13/04/22.
//

import UIKit

class ArchitectureViewController: UIViewController, Storyboarded {
    
    //MARK: - Variables
    var coordinator: MainVCCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitleWithDefaultBackButton(title: "IOS Architecture")
    }
    
    //MARK: - Actions
    @IBAction func mvcArchitectureAction(_ sender: UIButton) {
        coordinator?.startMVCArchitecture()
    }
    
    @IBAction func mvpArchitectureAction(_ sender: UIButton) {
        coordinator?.startMVPArchitecture()
    }
    
    @IBAction func mvvmArchitectureAction(_ sender: UIButton) {
        coordinator?.startWebService()
    }
    
}//End of class
