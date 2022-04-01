import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    var coordinator: MainVCCoordinator?
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions
    @IBAction func goToBasicAutoLayout(_ sender: UIButton) {
        performSegue(withIdentifier: "goToBasicAutoLayout", sender: self)
    }
    
    @IBAction func goToUIComponent(_ sender: UIButton) {
        performSegue(withIdentifier: "goToUIComponent", sender: self)
    }
    
    @IBAction func goToWebServices(_ sender: UIButton) {
        coordinator?.startWebService()
    }
    
}//End of class
