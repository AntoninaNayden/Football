import SwiftUI

struct Rules: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
            VStack {
                Spacer()
                    .frame(height: 200)
                Button(action: {
                    dismiss()
                }, label: {
                    Image("back")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 200)
                })
                    Image("rulesMen")
                        .resizable()
                        .frame(width: 500, height: 780)
                        .padding(.trailing,30)
                   
            }
            .background(
                Image("fon2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Rules()
}


