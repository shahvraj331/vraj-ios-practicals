import UIKit

class UILoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var btnBack: UIImageView!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackFunctionality()
    }
    
    //MARK: - Actions
    @IBAction func onLoginClicked(_ sender: UIButton) {
        Validation.showToast(controller: self, message: "Login Success", seconds: 1.5)
    }
    
}//End of class

//MARK: - File private functions
extension UILoginViewController {
    
    fileprivate func addBackFunctionality() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
}//End of extendion
