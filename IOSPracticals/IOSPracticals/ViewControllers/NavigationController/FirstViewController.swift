import UIKit

class FirstViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfMessageToSecond: UITextField!
    @IBOutlet weak var lblMessageFromSecond: UILabel!
    
    //MARK: - Variables
    var coordinator: FirstVCCoordinator?
    var delegate: DataTransferDelegate?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfMessageToSecond.text = ""
        self.navigationItem.backButtonTitle = "Back"
    }
    
    //MARK: - Actions
    @IBAction func goToSecondVC(_ sender: UIButton) {
        if let message = tfMessageToSecond.text {
            coordinator?.goToSecondVC(message, self)
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - File private functions
    fileprivate func setUpViewController() {
        self.title = "First"
        if let navController = self.navigationController {
            coordinator = FirstVCCoordinator(navController)
        }
        self.dismissKeyboardOnTap(view)
    }
    
}//End of class

//MARK: - DataTransferDelegate
extension FirstViewController: DataTransferDelegate {
    
    func passData(_ passedData: String) {
        lblMessageFromSecond.text = passedData
    }
    
}//End of extension

//MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}//End of extension
