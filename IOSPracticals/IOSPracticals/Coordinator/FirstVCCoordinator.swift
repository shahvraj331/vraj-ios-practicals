import UIKit

class FirstVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let firstVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
    
    func goToSecondVC(_ message: String, _ delegate: DataTransferDelegate) {
        if let navigationController = navController {
            let secondVCCoordinator = SecondVCCoordinator(navigationController)
            secondVCCoordinator.startWithData(message, delegate)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}//End of class
