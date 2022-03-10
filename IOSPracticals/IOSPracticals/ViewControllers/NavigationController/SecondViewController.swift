import UIKit

protocol DataTransferDelegate {
    func passData(_ passedData: String)
}

class SecondViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfMessageToFirst: UITextField!
    @IBOutlet weak var lblMessageFromFirst: UILabel!
    
    //MARK: - Variables
    var coordinator: SecondVCCoordinator?
    var delegate: DataTransferDelegate?
    var messageFromFirst: String?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBarButton()
        setUpViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfMessageToFirst.text = ""
        self.navigationItem.backButtonTitle = "Back"
    }
    
    //MARK: - Actions
    @IBAction func goToThirdVC(_ sender: UIButton) {
        coordinator?.goToThirdVC()
    }
    
    @IBAction func goToFourthVC(_ sender: UIButton) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController {
            viewController.completion = { message in
                self.lblMessageFromFirst.text = message
            }
            if let completion = viewController.completion {
                coordinator?.goToFourthVC(completion)
            }
        }
    }
    
    //MARK: - File private functions
    fileprivate func setUpBarButton() {
        let backToFirstVCButton = UIBarButtonItem(title: "Pass data", style: .done, target: self, action: #selector(backToFirstVC))
        self.navigationItem.rightBarButtonItem  = backToFirstVCButton
    }
    
    @objc func backToFirstVC() {
        guard let data = tfMessageToFirst.text else { return }
        self.delegate?.passData(data)
        coordinator?.finish()
    }
    
    fileprivate func setUpViewController() {
        self.title = "Second"
        if let message = messageFromFirst {
            lblMessageFromFirst.text = message
        }
    }
    
}//End of class
