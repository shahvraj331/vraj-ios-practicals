import UIKit

class SecondVCCoordinator: Coordinator {
    
    var navController: UINavigationController?
    
    init (_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    func start() {
        if let secondVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondVC.coordinator = self
            navController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func startWithData(_ message: String, _ delegate: DataTransferDelegate) {
        if let secondVC = UIStoryboard(name: "Navigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondVC.coordinator = self
            secondVC.delegate = delegate
            secondVC.messageFromFirst = message
            navController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func goToThirdVC() {
        if let navigationController = navController {
            let thirdVCCoordinator = ThirdVCCoordinator(navigationController)
            thirdVCCoordinator.start()
        }
    }
    
    func goToFourthVC(_ completion: @escaping (String) -> Void) {
        if let navigationController = navController {
            let fourthVCCoordinator = FourthVCCoordinator(navigationController)
            fourthVCCoordinator.startWithData(completion)
        }
    }
    
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navController?.popToRootViewController(animated: true)
    }
    
}//End of class
