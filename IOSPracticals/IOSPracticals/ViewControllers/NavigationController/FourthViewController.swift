import UIKit

class FourthViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfMessageToSend: UITextField!
    
    //MARK: - Variables
    var coordinator: FourthVCCoordinator?
    var backToFirstVCButton: UIBarButtonItem?
    var completion: completionHandler?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    //MARK: - Actions
    @IBAction func goToRootVC(_ sender: UIButton) {
        coordinator?.finishToRoot()
    }
    
    @IBAction func goToSecondVC(_ sender: UIButton) {
        coordinator?.goToVCByIndex(1)
    }
    
    @IBAction func passDataToSecond(_ sender: UIButton) {
        guard let name = tfMessageToSend.text else { return }
        guard let completionBlock = completion else { return }
        completionBlock(name)
        coordinator?.finish()
    }
    
    //MARK: - File private functions
    fileprivate func setUpBarButton() {
        backToFirstVCButton = UIBarButtonItem(image: UIImage(systemName: "pin.fill"), style: .plain, target: self, action: #selector(popUpFifthVC))
        backToFirstVCButton?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem  = backToFirstVCButton
    }
    
    @objc func popUpFifthVC() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewController") {
            vc.modalPresentationStyle = .popover
            if let popOver = vc.popoverPresentationController {
                let popover: UIPopoverPresentationController = popOver
                popover.barButtonItem = backToFirstVCButton
                present(vc, animated: true, completion:nil)
            }
        }
    }
    
    fileprivate func setUpViewController() {
        self.title = "Fourth"
        backToFirstVCButton = UIBarButtonItem()
        self.dismissKeyboardOnTap(view)
        setUpBarButton()
    }
    
}//End of class

//MARK: - UITextFieldDelegate
extension FourthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}//End of extension
