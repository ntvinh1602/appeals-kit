#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\canned-responses\adgroup\violation.ahk

NewAG(MainGUI) {
  ; Dimensions
  W_Col1 := 300
  W_Col2 := 300
  W_Col3 := 300
  ColSpacing := 15
  ButtonSpacing := 4

  ; Column 1
  MainGUI.UI.AddText("w" W_Col1 " Section", "Violations")

  ; Generate violation tree view
  ViolationTree := MainGUI.UI.Add("TreeView", "R35 wp Checked -HScroll")
  TreeParent := Array()
  for category in Violation["Category"] {
    TreeParent.Push(ViolationTree.Add(category, , "Bold"))
    for label in Violation[category]
      ViolationTree.Add(label, TreeParent[TreeParent.Length], "Sort")
    ViolationTree.Modify(TreeParent[TreeParent.Length], "Expand")
  }
  ViolationTree.Modify(TreeParent[1], "VisFirst") ; Scroll to top

  ; Column 2
  MainGUI.UI.AddText(
    "w" W_Col2 " x+" ColSpacing " ys Section",
    "Violation Location"
  )

  ; Column 3
  MainGUI.UI.AddText(
    "w" W_Col3 " x+" ColSpacing " ys Section",
    "Preview"
  )  
  Preview := MainGUI.UI.AddEdit("wp xp y+8 R36 ReadOnly", "")
  MainGUI.UI.AddButton(
    "Default w" W_Col3/2-ButtonSpacing/2 " xp y+8 R2.5",
    "Submit"
  )
  MainGUI.UI.AddButton(
    "w" W_Col3/2-ButtonSpacing/2 " x+" ButtonSpacing " yp R2.5",
    "Copy to Clipboard"
  )
}