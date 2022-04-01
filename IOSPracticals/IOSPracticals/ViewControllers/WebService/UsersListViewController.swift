//
//  UsersListViewController.swift
//  IOSPracticals
//
//  Created by Vraj Shah on 24/03/22.
//

import UIKit

class UsersListViewController: UIViewController, Storyboarded {

    //MARK: - Variables
    var coordinator: AuthenticationCoordinator?
    var usersList: UsersList?
    
    //MARK: - Outlets
    @IBOutlet weak var tvUsersList: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    @IBOutlet weak var btnAddUser: UIButton!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        getUsersList()
    }
    
    //MARK: - Actions
    @IBAction func addUserAction(_ sender: UIButton) {
        coordinator?.presentAddUser()
    }
    
    //MARK: - File private functions
    fileprivate func initializeView() {
        self.title = "Users list"
        progressBar.startAnimating()
        btnAddUser.layer.masksToBounds = true
        btnAddUser.layer.cornerRadius = btnAddUser.frame.height / 2
        tvUsersList.delegate = self
        tvUsersList.dataSource = self
    }
    
    fileprivate func getUsersList() {
        guard let url = URL(string: ApiUrl.delayResponseURL.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else { return }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                guard let responseData = try? JSONDecoder().decode(UsersList.self, from: prettyJsonData) else { return }
                self.usersList = responseData
                DispatchQueue.main.async {
                    self.progressBar.stopAnimating()
                    self.progressBar.alpha = 0
                    self.tableView.reloadData()
                }
            } catch {
                return
            }
        }.resume()
    }
    
}//End of class

//MARK: - UITableViewDelegate
extension UsersListViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = usersList?.data[indexPath.row].userID {
            coordinator?.startSingleUserVC(index)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}//End of extension

//MARK: - UITableViewDataSource
extension UsersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "singleUserCell") as? SingleUserTableViewCell {
            if let url = URL(string: usersList?.data[indexPath.row].avatar ?? "") {
                DispatchQueue.global().async {
                    guard let data = try? Data(contentsOf: url) else { return }
                    DispatchQueue.main.async {
                        cell.ivUserImage.image = UIImage(data: data)
                        cell.lblUserName.text = self.usersList?.data[indexPath.row].firstName
                        cell.lblUserEmail.text = self.usersList?.data[indexPath.row].email
                    }
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList?.data.count ?? 1
    }
    
}//End of extension
