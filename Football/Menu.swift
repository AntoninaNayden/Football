import SwiftUI

struct Menu: View {
    @State private var loadingProgress: CGFloat = 0.0

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 100)
                ZStack{
                    Image("men")
                        .resizable()
                        .frame(width: 400, height: 740)
                    HStack(spacing: 30) {
                         NavigationLink(destination: SwipeGameView()) {
                        Image("play")
                            .resizable()
                            .frame(width: 170, height: 100)
                        }
                        NavigationLink(destination: Rules()) {
                            Image("rules")
                                .resizable()
                                .frame(width: 170, height: 100)
                        }
                    }
                    .padding(.top,370)
                }
            }
            .background(
                Image("fon2")
                    .resizable()
                    .frame(width: 900, height: 1500)
                    .ignoresSafeArea()
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Menu()
}

