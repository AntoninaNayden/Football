import SwiftUI

struct Levels: View {
    @State private var currentPage: Int = 0

    private let levelImages: [[String]] = [
        ["level1", "level2", "level3", "level4"],
        ["level5", "level6", "level7", "level8"],
        ["level9", "level10", "level11", "level12"]
    ]

    var body: some View {
        NavigationStack {
            VStack {
                Image("LEVELS")
                TabView(selection: $currentPage) {
                    ForEach(0..<levelImages.count, id: \.self) { pageIndex in
                        ZStack {
                            let images = levelImages[pageIndex]
                            let count = images.count
                            let radius: CGFloat = 200
                            ForEach(0..<count, id: \.self) { index in
                                let angle = Angle(degrees: Double(index) * -200.0 / Double(count) - 100)
                                Image(images[index])
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .offset(
                                        x: radius * cos(angle.radians),
                                        y: radius * sin(angle.radians)
                                    )
                            }
                        }
                        .tag(pageIndex)
                    }
                    .padding(.leading,142)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .background(
                Group {
                    if currentPage == 2 {
                        Image("fon5")
                    }
                    else if(currentPage == 1){
                        Image("fon4")
                    }
                    else {
                        Image("fon3")
                    }
                }
                .scaledToFill()
                .ignoresSafeArea()
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Levels()
}
