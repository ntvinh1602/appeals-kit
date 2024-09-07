#Requires AutoHotkey v2.0

Response := Map()

Response["Pass"] := Map(
  "Text",
  [
    (
      "Dear Valuable Client,
    
      Thanks for contacting us and sorry for keeping you waiting. Your _DETAIL has been approved. Thanks for your patience and understanding.
      
      Please feel free to let us know if you have any further questions."
    )
  ],
  "Prompt",
  "What was approved?",
  "Examples",
  [
    "Ad group",
    "Ad account",
    "BC account",
    "Document"
  ],
  "Detail",
  [
    "ad group",
    "ad account",
    "BC account",
    "document"
  ]
)


Response["Deleted / Empty"] :=
(
  "Dear Valuable Client,
  
  Thanks for contacting us and sorry for keeping you waiting. Your ads group was _DETAIL on the platform. Please kindly re-check ad status from your end with your advertiser.

  Thanks for your patience and understanding. Please feel free to let us know if you have any further questions."
)