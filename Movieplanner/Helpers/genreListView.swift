//
//  genreLstView.swift
//  Movieplanner
//
//  Created by Роман on 10.06.2024.
//

import SwiftUI

struct genreListView: View {
    let items: [String]
   // let screenWidth = UIScreen.main.bounds.width
    let screenWidth: CGFloat = 250
    var groupedItems: [[String]] = [[String]]()
    
    init(items: [String]) {
        self.items = items
        groupedItems = createGroupItems(items)
    }
    
    private  func createGroupItems(_ items: [String]) -> [[String]]{
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] = [String]()
        var wigth: CGFloat = 0
        
        for word in items {
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.width + 32
            
            if (wigth + labelWidth + 32) < screenWidth {
                wigth += labelWidth
                tempItems.append(word)
            }else {
                wigth = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
        }
        groupedItems.append(tempItems)
        
        return groupedItems
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(groupedItems, id: \.self) { subItem in
                HStack{
                    ForEach(subItem, id: \.self) { word in
                        ganreIView(title: word)
                            .fixedSize()
                            
                    }
                }
            }
        }
    }
}

#Preview {
    genreListView(items: ["dog", "cat", "airplane", "sdfsadfsdafasdfdaf", "fdfsd"])
}
