//
//  DatePickerView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 13/11/24.
//

import SwiftUI

struct DatePickerView: View {
    var titleText: String = ""
    @State private var selectedDate = Date()
    @State private var isPickerPresented = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
            if !titleText.isEmpty {
                Text(titleText)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
            }
            HStack {
                // Display selected date or placeholder
                Text(selectedDate, formatter: dateFormatter)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        isPickerPresented = true
                    }
                
                Spacer()
                
                // Calendar icon to open date picker
                Image("ic_calender")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24 * iPadMultiplier, height: 24 * iPadMultiplier)
                    .padding(.horizontal, 5 * iPadMultiplier)
                    .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                    .onTapGesture {
                        isPickerPresented = true
                    }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8 * iPadMultiplier)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1 * iPadMultiplier)
            )
            //        .padding(.horizontal)
            .sheet(isPresented: $isPickerPresented) {
                VStack {
                    DatePicker(
                        "Select Date",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                    
                    Button("Done") {
                        isPickerPresented = false
                    }
                    .padding()
                }
            }
        }
    }
    
    // Date formatter to display date in mm/dd/yyyy format
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

