//
//  FriendListVC.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import UIKit

// Class only protocol, b'coz FLVC needs to be weak in presenter
protocol FriendListDisplayLogic: class {
  func displayFetchedFriends(viewModels: [FriendViewModel])
  func showLoader(msg: String)
  func hideLoader()
  func fetchingFriendsFailed(msg: String)
}

class FriendListVC: UIViewController, FriendListDisplayLogic {
  // Table view for updating the cells
  var tableView: UITableView!
  var viewModels: [FriendViewModel] = []
  
  // Clean Architecture references
  var interactor: FriendListBusinessLogic!
  var router: (FriendListRoutingLogic & FriendListDataPassing)!
  
  // MARK: Object lifecycle
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setUpCleanArchitecture()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUpCleanArchitecture()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Set the titile, we can also localize the text
    self.title = "All Friends"
    //TODO: Remove me
    self.view.backgroundColor = .green
    // Setup table view
    setUpTableView()
    // Fetch the friend list
    self.interactor.fetchFriends()
  }
  
  // Set ups the clean architecture ()
  private func setUpCleanArchitecture() {
    let viewController = self
    let interactor = FriendListInteractor()
    let presenter = FriendListPresenter()
    let router = FriendListRouter()
    viewController.interactor = interactor // strong reference
    viewController.router = router // strong reference
    interactor.presenter = presenter // strong reference
    presenter.viewController = viewController // weak reference
    router.viewController = viewController // weak reference
    router.dataStore = interactor
  
  }
  
  /// Set ups the table view to display the list of friends
  private func setUpTableView() {
    self.tableView = UITableView(frame: .zero)
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
      ])
    
    self.tableView.backgroundColor = .purple
    //Register class
    self.tableView.register(FriendListCell.self, forCellReuseIdentifier: NSStringFromClass(FriendListCell.self))
  }
  
  // MARK: ListFrinedsDisplayLogic
  func displayFetchedFriends(viewModels: [FriendViewModel]) {
    self.viewModels = viewModels
    self.tableView.reloadData()
  }
  
  func fetchingFriendsFailed(msg: String) {
    
  }
  
  func showLoader(msg: String) {
    
  }
  
  func hideLoader() {
    
  }
  // ~ ~ ~ ~ ~ ListFriendsDisplayLogic Ends ~ ~ ~ ~ ~
}

extension FriendListVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
}

extension FriendListVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModels.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(FriendListCell.self), for: indexPath) as! FriendListCell
    let viewModel = self.viewModels[indexPath.row]
    cell.nameLabel.text = viewModel.name
    cell.emailLabel.text = viewModel.email
    return cell
  }
}
