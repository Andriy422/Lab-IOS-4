import SwiftUI

struct ContentView: View {
    
    @State var data = ""
    
    var isValidStudentID: Bool {
        let pattern = "^[A-ZА-ЯІЇЄ]{2}\\d{6}$"
        return data.range(of: pattern, options: .regularExpression) != nil
    }

    var borderColor: Color {
        if isValidStudentID || data.isEmpty {
            return Color.blue.opacity(0.3)
        } else {
            return Color.red.opacity(0.5)
        }
    }
    var body: some View {
        
        
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(21), .purple.opacity(10)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    
                    Image(systemName: "bus.doubledecker")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 100)
                        .foregroundStyle(.black)
                        .shadow(color: .black.opacity(0.20), radius: 0, x: 0, y: 0)
                        .padding(.top, 20)

                    VStack(spacing: 6) {
                        Text("Bus.Travel")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)

                        Text("Найкращий перевізник Лісотеха")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    }
                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.blue)
                                .frame(width: 24)
                            Text("Email:")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("andrii@example.com")
                                .foregroundColor(.gray)
                        }

                        Divider()

                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                                .frame(width: 24)
                            Text("Місце відправки:")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("м.Львів, вул.Ген.Чупринки, 103")
                                .foregroundColor(.gray)
                        }

                        Divider()

                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.red)
                                .frame(width: 24)
                            Text("Місце прибуття:")
                                .fontWeight(.semibold)
                            Spacer()
                            Text("м.Київ")
                                .foregroundColor(.gray)
                        }
                        
                        Divider()

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Введіть номер студентського квитка :")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            TextField("Введіть номер сюди...", text: $data)
                                .textInputAutocapitalization(.characters)
                                .padding()
                                .background(Color(.systemGroupedBackground))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke( Color.blue.opacity(0.3),
                                                 lineWidth: 1)
                                )

                            if !data.isEmpty {
                                HStack {
                                Text(isValidStudentID ? "Введене значення:" : "Невірний формат:")
                                        .bold()
                                    Text(data)
                                        .italic()
                                }
                                .font(.footnote)
                                .foregroundColor(isValidStudentID ? .blue : .red)
                                .padding(.top, 4)
                            }
                        }
                        .padding(.top, 6)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
                    .padding(.horizontal)

                    Button(action: {
                        print("Форму відправлено: \(data)")
                    }) {
                        Text("Підтвердити")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isValidStudentID ? Color.blue : Color.gray)
                            .cornerRadius(10)
                    }
                    .disabled(!isValidStudentID)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
