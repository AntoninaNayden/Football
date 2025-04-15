import SwiftUI

struct ContentView: View {
    @State private var loadingProgress: CGFloat = 0.0
    @State private var isLoadingComplete = false

    var body: some View {
        if isLoadingComplete {
            Menu()
        } else {
            ZStack {
                Image("fon")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                        .frame(height: 240)
                    Image("loading")
                        .resizable()
                        .frame(width: 275, height: 70)
                        .padding(.leading,20)
                    
                    ZStack(alignment: .leading) {
                        Image("loading1")
                            .resizable()
                            .frame(width: 350, height: 30)
                        
                        Image("loading2")
                            .resizable()
                            .frame(width: loadingProgress, height: 30)
                            .clipped()
                    }
                    .frame(height: 50)
                    .onAppear {
                        startLoading()
                    }
                }
            }
        }
    }
    
    func startLoading() {
        withAnimation(.linear(duration: 5)) {
            loadingProgress = 350
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            isLoadingComplete = true
        }
    }
}


#Preview {
    ContentView()
}


