(* Mathematica Test File    *)


BeginTestSection["GitHubAction"]

VerificationTest[
  1+1
  ,
  2
  ,
  TestID->"Simple_Expression"
]

VerificationTest[
  1/0
  ,
  ComplexInfinity
  ,
  Power::infy
  ,
  TestID->"Message_Output"
]

VerificationTest[
  RandomInteger[]
  ,
  0|1
  ,
  SameTest -> MatchQ
  ,
  TestID->"Match_Random"
]

VerificationTest[
  ResourceFunction["GrayCode"][100]
  ,
  {1, 0, 1, 0, 1, 1, 0}
  ,
  TestID->"Resource_Accessibility"
]

EndTestSection[]
