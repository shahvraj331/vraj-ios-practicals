import UIKit

class ThirdViewController: UIViewController {

    //MARK: - Variables
    var coordinator: ThirdVCCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func goToFirstVC(_ sender: UIButton) {
        coordinator?.finish()
    }
    
}//End of class

