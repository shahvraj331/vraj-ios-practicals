import UIKit

class ThirdVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let thirdVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            thirdVC.coordinator = self
            navController?.present(thirdVC, animated: true, completion: nil)
        }
    }
    
    func finish() {
        navController?.dismiss(animated: true, completion: nil)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}//End of class
