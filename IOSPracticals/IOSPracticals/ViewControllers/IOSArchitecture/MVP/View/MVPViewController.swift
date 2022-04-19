//
//  MVPViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 13/04/22.
//

import UIKit

class MVPViewController: UIViewController, Storyboarded {
    
    //MARK: - Variables
    let presenter = Presenter()
    let colorArray = ["red","yellow","green","pink","white"]
    var currentIndexOfColor = 0
    
    //MARK: - Outlets
    @IBOutlet var parentView: UIView!
    
    //MARK: - UIviewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitleWithDefaultBackButton(title: "MVP Architecture")
        presenter.presenter = self
    }

    //MARK: - Actions
    @IBAction func btnChangeBackground(_ sender: UIButton) {
        presenter.updateBackgroundColor(color: colorArray[currentIndexOfColor])
        if currentIndexOfColor == colorArray.count - 1 {
            currentIndexOfColor = 0
        } else {
            currentIndexOfColor += 1
        }
    }
    
}//End of class

extension MVPViewController: BackgroundDelegate {
    
    func changeBackground(color: UIColor) {
        parentView.backgroundColor = color
    }
    
}//End of extension
