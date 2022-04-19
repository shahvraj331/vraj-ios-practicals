//
//  CustomTextField.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 25/04/22.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 10, left: textStartPadding, bottom: 10, right: 0))
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    //MARK: - IBInspectables
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var textStartPadding: CGFloat = 0
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    //MARK: - Class functions
    func updateView() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
        self.layer.cornerRadius = 5.0
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            imageView.contentMode = .center
            imageView.image = image
            imageView.tintColor = color
            imageView.image = image.withAlignmentRectInsets(UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        //attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
}//End of class
