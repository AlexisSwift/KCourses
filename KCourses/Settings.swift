//
//  Settings.swift
//  KCourses
//
//  Created by Sasha Kondratjeva on 20.12.2020.
//

import SwiftUI

struct Settings: View {

   @State var receive = false
   @State var number = 1
   @State var selection = 1
   @State var date = Date()
   @State var email = ""
   @State var submit = false

   var body: some View {
      NavigationView {
         Form {
            Toggle(isOn: $receive) {
               Text("Получение уведомлений")
            }
            Stepper(value: $number, in: 1...10) {
               Text("\(number) уведомление\(number > 1 ? "s" : "") в неделю")
            }
            Picker(selection: $selection, label: Text("Лучший курс")) {
               Text("SwiftUI").tag(1)
               Text("React").tag(2)
            }
            DatePicker(selection: $date, label: {
               Text("Дата")
            })
            Section(header: Text("Email")) {
               TextField("Your email: ", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: { self.submit.toggle() }) {
                Text("Сохранить")
            }
            .alert(isPresented: $submit, content: {
               Alert(title: Text("Thanks"), message: Text("Email: \(email)"))
            })
         }
         .navigationBarTitle("Настройки")
      }
   }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
   static var previews: some View {
      Settings()
   }
}
#endif

