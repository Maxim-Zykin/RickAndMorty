//
//  CharactersCollectionView.swift
//  RickAndMorty
//
//  Created by Максим Зыкин on 17.08.2023.
//

import UIKit

class CharactersCollectionView: UIViewController {

   lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: makeLayout()
    )
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private var viewModel: CharactersCollectionViewControllerModelProtocol! {
        didSet {
            viewModel.fetchCharacters {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        viewModel = CharactersCollectionViewControllerModel()
        collectionView.dataSource = self
        setup()
        setupNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 20
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(156),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(202))
        
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        }

    private func setup() {
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.cellID)
        collectionView.backgroundColor = UIColor(
            red: 4/255,
            green: 12/255,
            blue: 30/255,
            alpha: 255/255
        )
        
        // Настройка индикатора загрузки
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarApperanse = UINavigationBarAppearance()
        navBarApperanse.configureWithOpaqueBackground()
        navBarApperanse.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperanse.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarApperanse.backgroundColor = UIColor(
            red: 4/255,
            green: 12/255,
            blue: 30/255,
            alpha: 255/255
        )
        
        navigationController?.navigationBar.standardAppearance = navBarApperanse
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperanse
    }
    
    private func loadMoreCharacters() {
        guard viewModel.hasMoreData && !viewModel.isLoading else { return }
        
        activityIndicator.startAnimating()
        viewModel.loadMoreCharacters { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.collectionView.reloadData()
            }
        }
    }
}

extension CharactersCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.cellID, for: indexPath) as! CharactersCollectionViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}
 
extension CharactersCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailView()
        let info = viewModel.viewModelForSelectedRow(at: indexPath)
        
        detail.namePerson.text = info.nameLabel
        DispatchQueue.global().async {
            guard let imageData = info.image else { return }
            DispatchQueue.main.async {
                detail.imagePerson.image = UIImage(data: imageData)
            }
        }
        detail.statusPerson.text = info.statusLabel
        detail.speciesPerson.text = info.speciesLabel
        detail.typePerson.text = info.typeLabel
        detail.genderPerson.text = info.genderLabel
        detail.originPerson.text = info.locationLabel
        
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension CharactersCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        // Загружаем больше данных когда пользователь прокрутил до 80% от конца
        if offsetY > contentHeight - height * 1.2 {
            loadMoreCharacters()
        }
    }
}
