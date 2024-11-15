//
//  OpportunityAddEditView.swift
//  Main_CRM
//
//  Created by Mukesh Behera on 13/11/24.
//

import SwiftUI

struct OpportunityAddEditView: View {
    @State private var selectedStage = "Sales - Demo Scheduled"
    @State private var estimatedCloseDate = Date()
    @State private var confidenceLevel: Double = 45
    @State private var valueType = "Fixed Value"
    @State private var fixedValue = 1370.0
    @State private var rangeValueStart = 1370.0
    @State private var rangeValueEnd = 1370.0
    @State private var paymentFrequency = "One-time"
    @State private var selectedClient = "Charles K."
    @State private var serviceAddress = "123 Main Street, Charles Lane 458787"
    @State private var relatedToCounter = 1
    
    @State private var selectedOption = "Scheduled" // Create this for every MenuPickerView
    
    @State private var isShowPopUp = false
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(alignment: .leading,spacing: 20 * iPadMultiplier) {
                    Text("Create Opportunity")
                        .font(Font.custom(FontBook.Semibold.rawValue, size: 18 * iPadMultiplier))
                        .padding(.leading, 16 * iPadMultiplier)
                        .padding(.trailing, 16 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
                    
                    VStack(alignment: .leading, spacing: 12 * iPadMultiplier) {
                        // Stage Section
                        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
                            //                        Text("Stage")
                            //                            .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                            //                            .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            
                            MenuPickerView(titleText: "Stage",isShowInfieldTitle: true, selectedOption: $selectedOption, action: {
                                print("jjd")
                            })
                        }
                        
                        // Estimated Close Section
                        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
                            Text("Estimated Close")
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            //DatePicker("mm/dd/yyyy", selection: $estimatedCloseDate, displayedComponents: .date)
                            DatePickerView()
                            
                        }
                        
                        // Confidence Level Section
                        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
                            HStack {
                                Text("Confidence Level")
                                    .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                                Spacer()
                                Text("\(Int(confidenceLevel))%")
                                    .font(Font.custom(FontBook.SemiboldIT.rawValue, size: 14 * iPadMultiplier))
                                    .foregroundColor(Color(App_Colors.App_Black_Color.rawValue))
                            }
                            Slider(value: $confidenceLevel, in: 0...100)
                                .accentColor(.red)
                        }
                        
                        HStack {
                            Text("Related")
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            Spacer()
                            Button {
                                relatedToCounter += 1
                            } label: {
                                HStack {
                                    Image(systemName: "plus") // Plus icon after the text
                                        .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                                    Text("Add New")
                                        .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                                        .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                                }
                            }
                        }
                        ForEach(0..<relatedToCounter, id: \.self) { i in
                            RelatedToView(deleteAction: {
                                relatedToCounter -= 1
                            })
                        }
                        
                        // Value Section
                        VStack(alignment: .leading, spacing: 8 * iPadMultiplier) {
                            Text("Value")
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            
                            HStack(spacing: 20 * iPadMultiplier) {
                                // Fixed Value Radio Button
                                RadioButton(text: "Fixed Value", isSelected: valueType == "Fixed Value") {
                                    valueType = "Fixed Value"
                                }
                                .padding(.trailing, 38 * iPadMultiplier)
                                // Range Radio Button
                                RadioButton(text: "Range", isSelected: valueType == "Range") {
                                    valueType = "Range"
                                }
                            }
                            
                            //                        Picker("", selection: $valueType) {
                            //                            Text("Fixed Value").tag("Fixed Value")
                            //                            Text("Range").tag("Range")
                            //                        }
                            //                        .pickerStyle(SegmentedPickerStyle())
                            
                            if valueType == "Fixed Value" {
                                HStack {
                                    CurrencyTextField()
                                        .frame(maxWidth: .infinity)
                                    MenuPickerView(selectedOption: $selectedOption, action: {
                                        print("kdk")
                                    })
                                    .frame(maxWidth: .infinity)
                                }
                            } else {
                                HStack {
                                    CurrencyTextField()
                                        .frame(maxWidth: .infinity)
                                    Text("To")
                                    CurrencyTextField()
                                        .frame(maxWidth: .infinity)
                                }
                                
                                
                                MenuPickerView(selectedOption: $selectedOption, action: {
                                    print("kdk")
                                })
                            }
                        }
                        
                        // Lead / Client Section
                        MenuPickerView(titleText: "Lead / Client", isShowProfileImage: true, imageName: "muk", selectedOption: $selectedOption, action: {
                            print("kdk")
                        })
                        
                        // Service Address Section
                        MenuPickerView(titleText: "Service Address", selectedOption: $selectedOption, action: {
                            print("kdk")
                        })
                        
                        
                        
                        MenuPickerView(titleText: "Team Members", isShowProfileImage: true, imageName: "muk", selectedOption: $selectedOption, action: {
                            print("kdk")
                        })
                        
                        CommonTextView(titleText: "Description", action: {
                            
                        })
                        
                        VStack(alignment: .leading) {
                            Text("Custom Fields")
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            Rectangle()
                                .frame(height: 0.5 * iPadMultiplier)
                                .foregroundColor(.gray)
                        }
                        
                        MenuPickerView(titleText: "Product Sample",isShowTrash: true, selectedOption: $selectedOption, action: {
                            print("kdk")
                        })
                        CommonTextView(titleText: "Client’s House Profile",isShowTrash: true, action: {
                            
                        })
                        
                        Rectangle()
                            .frame(height: 0.5 * iPadMultiplier)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Text("Add Custom Field to Opportunity")
                                .font(Font.custom(FontBook.Semibold.rawValue, size: 14 * iPadMultiplier))
                                .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                            Spacer()
                            Button {
                                print("kdk")
                            } label: {
                                Text("Reveal All")
                                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                                    .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                            }
                            
                        }
                        
                        MenuPickerView(selectedOption: $selectedOption, action: {
                            print("kdk")
                        })
                        Button {
                            print("kdk")
                        } label: {
                            HStack {
                                Image(systemName: "plus") // Plus icon after the text
                                    .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                                Text("Create New Custom Field")
                                    .font(Font.custom(FontBook.Semibold.rawValue, size: 12 * iPadMultiplier))
                                    .foregroundColor(Color(App_Colors.App_Blue_Color.rawValue))
                            }
                        }
                        .padding(.leading, 10 * iPadMultiplier)
                    }
                    .padding(.all, 8 * iPadMultiplier)
                    .background(Color.white)
                    .cornerRadius(6 * iPadMultiplier)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6 * iPadMultiplier)
                            .stroke(Color(App_Colors.App_Light_Gray_Color_1.rawValue), lineWidth: 1 * iPadMultiplier)
                    )
                    .padding(.all, 16 * iPadMultiplier)
                }
                
            }
            
            SaveCancelButtons(cancelTitle: "Cancel",saveTitle: "Save",deleteAction: {
                
            }, cancelAction: {
                
            }, saveAction: {
                print("Save clicked.....")
                isShowPopUp = true
                
            }, isShowDeleteButton: true)

//            CommonBottomSheet(isPresented: $isShowPopUp, sheetHeight: 360) {
//                TimeFilterView()
//            }
        }
//        .navigationTitle("Create Opportunity")
    }
}

#Preview {
    OpportunityAddEditView()
}

// Custom Radio Button Component
struct RadioButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 2 * iPadMultiplier) {
                Image(isSelected ? "ic_Radio_Button_Fill" : "ic_Radio_Button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32 * iPadMultiplier, height: 32 * iPadMultiplier)
                    .padding(.horizontal, 5 * iPadMultiplier)
                    .foregroundColor(isSelected ? .red : .gray)
                
                Text(text)
                    .font(Font.custom(FontBook.Regular.rawValue, size: 14 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Dark_Black_Color.rawValue))
            }
        }
        
    }
}


struct SaveCancelButtons: View {
    var cancelTitle: String
    var saveTitle: String
    let deleteAction: (() -> Void)?
    let cancelAction: () -> Void
    let saveAction: () -> Void
    var isShowDeleteButton = false
    
    init(
        cancelTitle:String = "",
        saveTitle:String = "",
        deleteAction: (() -> Void)? = nil,
        cancelAction: @escaping () -> Void,
        saveAction: @escaping () -> Void,
        isShowDeleteButton: Bool = false
    ) {
        self.cancelTitle = cancelTitle
        self.saveTitle = saveTitle
        self.deleteAction = deleteAction
        self.cancelAction = cancelAction
        self.saveAction = saveAction
        self.isShowDeleteButton = isShowDeleteButton
    }
    
    var body: some View {
        HStack(spacing: 20 * iPadMultiplier) {
            if isShowDeleteButton, let deleteAction = deleteAction {
                Button(action: deleteAction) {
                    Image("ic_trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28 * iPadMultiplier, height: 28 * iPadMultiplier)
                        .padding(.horizontal, 5 * iPadMultiplier)
                        .foregroundColor(Color(App_Colors.App_Red_Color.rawValue))
                }
            }
            
            Button(action: cancelAction) {
                Text(cancelTitle)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                    .foregroundColor(Color(App_Colors.App_Light_Gray_Color_2.rawValue))
                    .padding(.horizontal, 15 * iPadMultiplier)
            }
            
            Button(action: saveAction) {
                Text(saveTitle)
                    .font(Font.custom(FontBook.Semibold.rawValue, size: 16 * iPadMultiplier))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15 * iPadMultiplier)
            }
            .buttonStyle(PlainButtonStyle())
            .background(Color(App_Colors.App_Red_Color.rawValue))
            .cornerRadius(6 * iPadMultiplier)
            .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct SaveCancelButtons_Previews: PreviewProvider {
    static var previews: some View {
        SaveCancelButtons(
            cancelAction: {
                print("")
            }, saveAction: {
                print("")
            })
    }
}







