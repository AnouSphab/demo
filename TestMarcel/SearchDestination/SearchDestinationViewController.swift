//
//  SearchDestinationViewController.swift
//  TestMarcel
//
//  Created by Anou on 30/05/2019.
//  Copyright © 2019 Anou. All rights reserved.
//

import Foundation
import UIKit
import MarcelFrameworks

protocol SearchDestinationDelegate: class
{
  func didTapSearch()
  func didTapUserAddresses(index: Int)
}

class SearchDestinationViewController: UIViewController
{
  @IBOutlet private weak var contentView: UIView?
  @IBOutlet private weak var searchView: UIStackView?
  @IBOutlet private weak var tableView: UITableView?
  @IBOutlet private weak var searchTableView: UITableView?
  
  @IBOutlet private weak var locationTextfield: UITextField?
  @IBOutlet private weak var destinationTextfield: UITextField?
  
  weak var delegate: SearchDestinationDelegate?
  
  var interactor: SearchDestinationInteractorInput?
  
  var addresses: [DestinationViewModel] = []
  var predictions: [DestinationViewModel] = []
  
  let placesHelper = GoogleAutocompleteHelper()
  
  var fullMode: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    interactor = SearchDestinationFactory.createSearchModule(view: self)
    interactor?.getFavoritesAddresses()
    
    if fullMode {
      interactor?.getUserLocation()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if fullMode {
      navigationController?.setNavigationBarHidden(false, animated: animated)
    }
  }
  
  private func setupView() {
    contentView?.setShadow()
    searchView?.setRoundedCorners(withRadius: 15)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showSearch))
    contentView?.addGestureRecognizer(tapGesture)
  }
  
  @objc private func showSearch() {
    delegate?.didTapSearch()
  }
  
  @IBAction func destinationTextfieldDidChange(_ sender: Any) {
    guard let destination = destinationTextfield?.text else {
      return
    }
    
    queryAutocomplete(query: destination)
  }
  
  private func queryAutocomplete(query: String) {
    placesHelper.findAutocompletePredictions(from: query) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .failure:
        break
      case .success(let predictions):
        let predictionsViewModels = predictions.map(DestinationViewModel.init)
        self.predictions = predictionsViewModels
        self.searchTableView?.reloadData()
      }
    }
  }
}

extension SearchDestinationViewController: UITableViewDataSource
{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return .leastNonzeroMagnitude
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == self.tableView {
      return addresses.count
    } else {
      return predictions.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as SearchCell
    
    var viewModel: DestinationViewModel?
    if tableView == self.tableView {
      viewModel = addresses[indexPath.row]
    } else {
      viewModel = predictions[indexPath.row]
    }
    
    cell.setup(viewModel: viewModel)
    cell.selectionStyle = .none
    return cell
  }
}

extension SearchDestinationViewController: UITableViewDelegate
{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if fullMode {
      performSegue(withIdentifier: "showDriveProposal", sender: nil)
    } else {
      delegate?.didTapUserAddresses(index: indexPath.row)
    }
  }
}

extension SearchDestinationViewController: SearchDestinationPresenterOutput
{
  func showUserLocation(location: String) {
    locationTextfield?.text = location
  }
  
  func showFavoritesAddresses(_ addresses: [DestinationViewModel]) {
    self.addresses = addresses
    tableView?.reloadData()
  }
  
  func showError(_ message: String) {
    print(message)
  }
}


