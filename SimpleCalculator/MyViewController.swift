import UIKit

class MyViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Compositional Layout oluşturma
        let layout = createCompositionalLayout()
        
        // Collection view oluşturma
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(collectionView)
        
        // Collection view layout constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        // Birinci Bölüm: Yatay Liste
        let itemSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item1 = NSCollectionLayoutItem(layoutSize: itemSize1)
        
        let groupSize1 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize1, subitems: [item1])
        
        let section1 = NSCollectionLayoutSection(group: group1)
        section1.orthogonalScrollingBehavior = .continuous
        
        // İkinci Bölüm: Üç Sütunlu Izgara
        let itemSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)
        
        let groupSize2 = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3))
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize2, subitem: item2, count: 3)
        
        let section2 = NSCollectionLayoutSection(group: group2)
        
        // Layout Oluşturma
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return section1
            } else {
                return section2
            }
        }
        return layout
    }
}

// UICollectionViewDataSource ve UICollectionViewDelegate protokollerini ekleyelim
extension MyViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // İki bölüm
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Her bölümde 10 öğe
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue // Hücrelerin arka plan rengi mavi
        return cell
    }
}
