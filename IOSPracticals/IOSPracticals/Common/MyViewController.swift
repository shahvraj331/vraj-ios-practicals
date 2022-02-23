import UIKit

class MyViewController: UIViewController {

    static func addComponentResigner(_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
}//End of class
