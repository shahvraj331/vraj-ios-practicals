import UIKit

class SegmentViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var btnBack: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    //MARK: - Variables
    let refreshControl = UIRefreshControl()
    var flagVariable = 0
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackFunctionality()
        tableView.delegate = self
        tableView.dataSource = self
        setUpHeaderAndFooter()
        setUpRefreshControl()
    }
    
}//End of class

//MARK: - File private functions
extension SegmentViewController {
    
    fileprivate func addBackFunctionality() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func updateTable() {
        flagVariable = flagVariable == 0 ? 1 : 0
        UIView.animate(withDuration: 1.0) {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    fileprivate func setUpHeaderAndFooter() {
        headerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50)
        footerView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50)
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    fileprivate func setUpRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to change rows")
        refreshControl.tintColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1)
        refreshControl.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
}//end of extension

//MARK: - UITableViewDelegate
extension SegmentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
}//End of extension

//MARK: - UITableViewDataSource
extension SegmentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == flagVariable {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as? SwitchTableViewCell {
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell") as? CollectionTableViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }

}//End of extension
