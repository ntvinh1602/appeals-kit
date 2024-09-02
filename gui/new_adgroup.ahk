#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\canned-responses\adgroup\violation.ahk

NewAG(MainGUI) {
  ; Dimensions
  ColWidth := 290
  ColSpacing := 15
  ButtonSpacing := 4

  ; Column 1
  MainGUI.UI.AddText("w" ColWidth " Section", "Violations")

  ; Generate violation tree view
  ViolationTree := MainGUI.UI.Add("TreeView", "R35 wp Checked -HScroll")
  TreeParent := Array()
  TreeChild := Array()
  for category in Violation["Category"] {
    TreeParent.Push(ViolationTree.Add(category))
    for label in Violation[category]
      if label = "Pass"
        TreeChild.Push(ViolationTree.Add(label, TreeParent[TreeParent.Length], "Sort Select"))
      else
        TreeChild.Push(ViolationTree.Add(label, TreeParent[TreeParent.Length], "Sort"))
    ViolationTree.Modify(TreeParent[A_Index], "Bold Expand")
  }
  ViolationTree.Modify(TreeParent[1], "VisFirst")      

  ; Column 2
  MainGUI.UI.AddText("w" ColWidth " x+" ColSpacing " ys Section", "Options")
  MainGUI.UI.AddCheckBox("wp xp y+8", "Grace period for T0")
  MainGUI.UI.AddCheckBox("wp xp y+5", "Screenshots are not exhaustive")

  MainGUI.UI.AddText("wp xp y+8", "Target Audience")
  MainGUI.UI.AddRadio("wp xp y+8", "Internal")
  MainGUI.UI.AddRadio("wp xp y+5", "External")

  MainGUI.UI.AddGroupBox("wp xp y+8", "Editing: " ViolationTree.GetText(ViolationTree.GetSelection()))

  ;LocationTree := MainGUI.UI.Add("TreeView", "R35 wp Checked -HScroll")

  ; Column 3
  MainGUI.UI.AddText(
    "w" ColWidth " x+" ColSpacing " ys Section",
    "Preview"
  )  
  Preview := MainGUI.UI.AddEdit("wp xp y+8 R36 ReadOnly", "")
  MainGUI.UI.AddButton(
    "Default w" (ColWidth-ButtonSpacing)/2 " xp y+8 R2.5",
    "Submit"
  )
  MainGUI.UI.AddButton(
    "wp x+" ButtonSpacing " yp R2.5",
    "Copy"
  )
}