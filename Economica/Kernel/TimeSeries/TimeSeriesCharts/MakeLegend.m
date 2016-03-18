(*  box1 = Graphics[{VTBBlue, Rectangle[]}, ImageSize -> 16];
 box2 = Graphics[{VTBViolet, Rectangle[]}, ImageSize -> 16];
text1 = VTBTextStyle@voc["investment, pp"];
text2 = VTBTextStyle@voc["consumption, pp"];
line1 = Graphics[{VTBBlue, Line[{{0, 0.5}, {1, 0.5}}]},
   ImageSize -> {16, 16}];
text3 = VTBTextStyle@voc["domestic demand, % YoY"];
legend = Grid[
  {{box1, text1}, {box2, text2}, {line1, text3}}, 
  Alignment -> {{Right, Left}, Center}, 
  BaseStyle -> Directive[FontFamily -> "Arial"], 
  Spacings -> {{0, 0.5, 2}, 0}] 
  
  
  
  
  
  Export[FileNameJoin[{exportDirectory, "pic.pdf"}], %]*)
  
MakeLegend[list_] := Module[
  {icons, text, legend},
  icons = MapIndexed[
    Graphics[{PointSize[Large],Thickness[0.009],ColorData["Rainbow", First@#2],
       Which[#1 == "Box", Rectangle[],
        #1 == "Line", Line[{{0, 0.5}, {1, 0.5}}],
        #1=="Dot", Point[{0, 0}]
        ]
       }, ImageSize -> 16] &, list[[All, 2]]];
  text = VTBTextStyle /@ list[[All, 1]];
  
  legend = {icons, text}\[Transpose];
  Grid[legend, Alignment -> {{Right, Left}, Center}, 
   BaseStyle -> Directive[FontFamily -> "Arial", FontSize -> 22/1.5], 
   Spacings -> {{0, 0.5, 2}, 0}]
]
  