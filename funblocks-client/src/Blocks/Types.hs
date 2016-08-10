{-# LANGUAGE OverloadedStrings #-}
{-
  Copyright 2016 The CodeWorld Authors. All Rights Reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-}

module Blocks.Types(setBlockTypes, getTypeBlocks)
  where

import Blockly.DesignBlock 
import Blockly.General
import Blockly.Event
import qualified Data.Text as T

colorPicture = Color 160
colorNumber = Color 210
colorProgram = Color 0
colorColor = Color 290
colorPoly = Color 70
colorBool = Color 100
colorText = Color 45

typePicture = Picture
typeNumber = Number
typeProgram = Top
typeColor = Col
typeBool = Bool
typeText = Str
typeComment = Comment

inlineDef = Inline False

letVar = DesignBlock "letVar" ""
            [Dummy [TextInput "foo" "VARNAME"
            ,TextE "Let"]
           ,Value "VARVALUE" [Text ""]]
          inlineDef colorPoly [Poly 'a', Top]
          (Tooltip "Enter name of the variable")

-- PICTURE ----------------------------------------------
cwBlank = DesignBlock "cwBlank" "blank"
          [Dummy 
            [TextE "Blank"]
          ]
          inlineDef colorPicture [Picture] 
          (Tooltip "Blank picture")

cwCoordinatePlane = DesignBlock "cwCoordinatePlane" "coordinatePlane" 
          [Dummy 
            [TextE "Coordinate Plane"]
          ]
          inlineDef colorPicture [Picture] 
          (Tooltip "Picture of coordinate plane")

cwCodeWorldLogo = DesignBlock "cwCodeWorldLogo" "codeWorldLogo"
          [Dummy 
            [TextE "CodeWorld Logo"]
          ]
          inlineDef colorPicture [Picture] 
          (Tooltip "Picture of CodeWorld logo")

cwText = DesignBlock "cwText" "text"
          [Value "TEXT" [TextE "Text" ] ]
          inlineDef colorPicture [typeText, Picture] 
          (Tooltip "Enter some text")

cwDrawingOf = DesignBlock "cwDrawingOf" ""
          [Dummy [TextE "Drawing Of"] 
           ,Value "VALUE" [] ] 
          inlineDef colorProgram [typePicture, typeProgram]
          (Tooltip "Displays a drawing of a picture")

cwCircle = DesignBlock "cwCircle" "circle"
          [Dummy [TextE "Circle"] 
           ,Value "RADIUS" [Text "Radius"]] 
          inlineDef colorPicture [typeNumber, typePicture]
          (Tooltip "Picture of a circle")

cwThickCircle = DesignBlock "cwThickCircle" "thickCircle"
          [Dummy [TextE "Thick Circle"] 
           ,Value "RADIUS" [Text "Radius"] 
           ,Value "LINEWIDTH" [Text "Line width"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typePicture]
          (Tooltip "Picture of a circle")

cwSolidCircle = DesignBlock "cwSolidCircle" "solidCircle"
          [Dummy [TextE "Solid Circle"] 
           ,Value "RADIUS"  [Text "Radius"] ] 
          inlineDef colorPicture [typeNumber, typePicture]
          (Tooltip "Picture of a solid circle")

cwRectangle = DesignBlock "cwRectangle" "rectangle"
          [Dummy [TextE "Rectangle"] 
           ,Value "WIDTH"  [Text "Width"] 
           ,Value "HEIGHT"  [Text "Height"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typePicture] 
          (Tooltip "Picture of a rectangle")

cwThickRectangle = DesignBlock "cwThickRectangle" "thickRectangle"
          [Dummy [TextE "Thick Rectangle"] 
           ,Value "WIDTH" [Text "Width"] 
           ,Value "HEIGHT" [Text "Height"] 
           ,Value "LINEWIDTH" [Text "Line Width"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typePicture] 
          (Tooltip "Picture of a rectangle")

cwSolidRectangle = DesignBlock "cwSolidRectangle" "solidRectangle"
          [Dummy [TextE "Solid Rectangle"] 
           ,Value "WIDTH" [Text "Width"] 
           ,Value "HEIGHT" [Text "Height"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typePicture]
          (Tooltip "Picture of a solid rectangle")

cwArc = DesignBlock "cwArc" "arc"
          [Dummy [TextE "Arc"] 
            ,Value "STARTANGLE" [Text "Start Angle"] 
           ,Value "ENDANGLE" [Text "End Angle"] 
           ,Value "RADIUS" [Text "Radius"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typeNumber, typePicture] 
          (Tooltip "A thin arc")

cwSector = DesignBlock "cwSector" "sector"
          [Dummy [TextE "Sector"] 
            ,Value "STARTANGLE" [Text "Start Angle"] 
           ,Value "ENDANGLE" [Text "End Angle"] 
           ,Value "RADIUS" [Text "Radius"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typeNumber, typePicture]
          (Tooltip "A solid sector of a circle")

cwThickArc = DesignBlock "cwThickArc" "thickArc"
          [Dummy [TextE "Thick Arc"] 
            ,Value "STARTANGLE" [Text "Start Angle"] 
           ,Value "ENDANGLE" [Text "End Angle"] 
           ,Value "RADIUS" [Text "Radius"] 
           ,Value "LINEWIDTH" [Text "Line width"] ] 
          inlineDef colorPicture [typeNumber, typeNumber, typeNumber, typeNumber, typePicture] 
          (Tooltip "A arc with variable line width")

-- Transformations -----------------------------------------------
cwColored = DesignBlock "cwColored" "colored"
          [Dummy [TextE "Colored"] 
           ,Value "PICTURE" [Text "Picture"] 
           ,Value "COLOR" [Text "Color"] ] 
          inlineDef colorPicture [typePicture, typeColor, typePicture]
          (Tooltip "Change the color of a picture")

cwTranslate = DesignBlock "cwTranslate" "translated"
          [Dummy [TextE "Translated"] 
           ,Value "PICTURE" [Text "Picture"] 
           ,Value "X" [Text "x"] 
           ,Value "Y" [Text "y"] 
          ] 
          inlineDef colorPicture [typePicture, typeNumber, typeNumber, typePicture]
          (Tooltip "Translate a picture")

cwScale = DesignBlock "cwScale" "scaled"
          [Dummy [TextE "Scaled"] 
           ,Value "PICTURE" [Text "Picture"] 
           ,Value "HORZ" [Text "Horizontal"] 
           ,Value "VERTZ" [Text "Vertical"] 
          ] 
          inlineDef colorPicture [typePicture, typeNumber, typeNumber, typePicture]
          (Tooltip "Scale a picture")

cwRotate = DesignBlock "cwRotate" "rotated"
          [Dummy [TextE "Rotated"] 
           ,Value "PICTURE" [Text "Picture"] 
           ,Value "ANGLE" [Text "Angle"] 
          ] 
          inlineDef colorPicture [typePicture, typeNumber, typePicture ]
          (Tooltip "Rotate")

cwCombine = DesignBlock "cwCombine" "&"
          [ Value "PIC1" [] 
           ,Value "PIC2" [TextE "&"] 
          ]
          inlineDef colorPicture [typePicture, typePicture, typePicture]
          (Tooltip "Combines two pictures")

-- NUMBERS ---------------------------------------------

numNumber = DesignBlock "numNumber" "" 
          [Dummy 
            [TextInput "3" "NUMBER"]
          ]
          inlineDef colorNumber [typeNumber]
          (Tooltip "Enter a Number")

numAdd = DesignBlock "numAdd" "+"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "+"] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Add two numbers")

numSub = DesignBlock "numSub" "-"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "-"] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Subtract two numbers")

numMult = DesignBlock "numMult" "*"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "\xD7"] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Multiply two numbers")

numDiv = DesignBlock "numDiv" "/"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "\xF7"] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Divide two numbers")

numExp = DesignBlock "numExp" "^"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "^"] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Raise a number to a power")

numMax = DesignBlock "numMax" "max"
        [ Value "LEFT"  [TextE "Maximum"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Take the maximum of two numbers")

numMin = DesignBlock "numMin" "min"
        [ Value "LEFT"  [TextE "Minimum"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Take the minimum of two numbers")

numOpposite = DesignBlock "numOpposite" "opposite"
        [Value "NUM" [TextE "Opposite"] ]
         (Inline True) colorNumber [typeNumber, typeNumber]
         (Tooltip "Gives the negative of a number")

numAbs = DesignBlock "numAbs" "abs"
        [Value "NUM" [TextE "Absolute Value"] ]
         (Inline True) colorNumber [typeNumber, typeNumber]
         (Tooltip "Gives the absolute value of a number")

numRound = DesignBlock "numRound" "round"
        [Value "NUM" [TextE "Round"] ]
         (Inline True) colorNumber [typeNumber, typeNumber]
         (Tooltip "Gives the number rounded to the nearest integer")

numReciprocal = DesignBlock "numReciprocal" "reciprocal"
        [Value "NUM" [TextE "Reciprocal"] ]
         (Inline True) colorNumber [typeNumber, typeNumber]
         (Tooltip "Gives the reciprocal of a number")

numQuot = DesignBlock "numQuot" "quotient"
        [ Value "LEFT"  [TextE "Quotient"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Gives the integer part of the result when dividing two numbers")

numRem = DesignBlock "numRem" "remainder"
        [ Value "LEFT"  [TextE "Remainder"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Gives the remainder when dividing two numbers")

numPi = DesignBlock "numPi" "pi"
          [Dummy 
            [TextE "\x3C0"]
          ]
          inlineDef colorNumber [typeNumber]
          (Tooltip "The number pi, 3.1415..")

numSqrt = DesignBlock "numSqrt" "sqrt"
        [Value "NUM" [TextE "\x221A"] ]
         (Inline True) colorNumber [typeNumber, typeNumber]
         (Tooltip "Gives the square root of a number")

numGCD = DesignBlock "numGCD" "gcd"
        [ Value "LEFT"  [TextE "GCD"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Gives the greatest common demoninator between two numbers")

numLCM = DesignBlock "numLCM" "lcm"
        [ Value "LEFT"  [TextE "LCM"] 
         ,Value "RIGHT" [] 
         ]
         (Inline True) colorNumber [typeNumber, typeNumber, typeNumber]
         (Tooltip "Gives the least common multiple between two numbers")

-- TEXT ------------------------------------------------

txtConcat = DesignBlock "txtConcat" "<>"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "<>"] 
         ]
         (Inline True) colorText [typeText, typeText, typeText]
         (Tooltip "Concatenates two pieces of text together")

txtPrinted = DesignBlock "txtPrinted" "printed"
        [ Value "TEXT"  [TextE "Printed"] ]
         (Inline True) colorText [typeNumber, typeText]
         (Tooltip "Gives the text value of a number")

txtLowercase = DesignBlock "txtLowercase" "lowercase"
        [ Value "TEXT"  [TextE "Lowercase"] ]
         (Inline True) colorText [typeText, typeText]
         (Tooltip "Gives the text all in lowercase")

txtUppercase = DesignBlock "txtUppercase" "uppercase"
        [ Value "TEXT"  [TextE "Uppercase"] ]
         (Inline True) colorText [typeText, typeText]
         (Tooltip "Gives the text all in uppercase")

txtCapitalized = DesignBlock "txtCapitalized" "capitalized"
        [ Value "TEXT"  [TextE "Capitalized"] ]
         (Inline True) colorText [typeText, typeText]
         (Tooltip "Gives the text with the first value capitalized")

-- COLORS ----------------------------------------------
cwBlue = DesignBlock "cwBlue" "blue"
          [Dummy 
            [TextE "Blue"]
          ]
          inlineDef colorColor [typeColor] 
          (Tooltip "The color blue")

cwRed = DesignBlock "cwRed" "red"
          [Dummy 
            [TextE "Red"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color red")

cwGreen = DesignBlock "cwGreen" "green"
          [Dummy 
            [TextE "Green"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color green")

cwOrange = DesignBlock "cwOrange" "orange"
          [Dummy 
            [TextE "Orange"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color orange")

cwBrown = DesignBlock "cwBrown" "brown"
          [Dummy 
            [TextE "Brown"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color brown")

cwBlack = DesignBlock "cwBlack" "black"
          [Dummy 
            [TextE "Black"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color black")

cwWhite = DesignBlock "cwWhite" "white"
          [Dummy 
            [TextE "White"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color white")

cwCyan = DesignBlock "cwCyan" "cyan"
          [Dummy 
            [TextE "Cyan"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color cyan")

cwMagenta = DesignBlock "cwMagenta" "magenta"
          [Dummy 
            [TextE "Magenta"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color magenta")

cwYellow = DesignBlock "cwYellow" "yellow"
          [Dummy 
            [TextE "Yellow"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color yellow")

cwAquamarine = DesignBlock "cwAquamarine" "aquamarine"
          [Dummy 
            [TextE "Aquamarine"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color aquamarine")

cwAzure = DesignBlock "cwAzure" "azure"
          [Dummy 
            [TextE "Azure"]
          ]
          inlineDef colorColor [typeColor] 
          (Tooltip "The color azure")

cwViolet = DesignBlock "cwViolet" "violet"
          [Dummy 
            [TextE "Violet"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color violet")

cwChartreuse = DesignBlock "cwChartreuse" "chartreuse"
          [Dummy 
            [TextE "Chartreuse"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color chartreuse")

cwRose = DesignBlock "cwRose" "rose"
          [Dummy 
            [TextE "Rose"]
          ]
          inlineDef colorColor [typeColor] 
          (Tooltip "The color rose")

cwPink = DesignBlock "cwPink" "pink"
          [Dummy 
            [TextE "Pink"]
          ]
          inlineDef colorColor [typeColor]
          (Tooltip "The color pink")

cwPurple = DesignBlock "cwPurple" "purple"
          [Dummy 
            [TextE "Purple"]
          ]
          inlineDef colorColor [typeColor] 
          (Tooltip "The color purple")

cwGray = DesignBlock "cwGray" "gray"
          [Value "VALUE" [TextE "Gray"] ] 
          (Inline True) colorColor [typeNumber, typeColor]
          (Tooltip "The color gray, varying by an amount. Lower value is closer to black")

cwMixed = DesignBlock "cwMixed" "mixed"
          [Dummy [TextE "Mixed"] 
           ,Value "COL1"  [Text "Color"] 
           ,Value "COL2"  [Text "Color"] ] 
          inlineDef colorColor [typeColor, typeColor, typeColor]
          (Tooltip "Gives the mix of two colors")

cwLight = DesignBlock "cwLight" "light"
          [Value "COL" [TextE "Light"] ] 
          (Inline True) colorColor [typeColor, typeColor]
          (Tooltip "Makes a color lighter")

cwDark = DesignBlock "cwDark" "dark"
          [Value "COL" [TextE "Dark"] ] 
          (Inline True) colorColor [typeColor, typeColor]
          (Tooltip "Makes a color darker")

cwBright = DesignBlock "cwBright" "bright"
          [Value "COL" [TextE "Bright"] ] 
          (Inline True) colorColor [typeColor, typeColor]
          (Tooltip "Makes a color brighter")

cwDull = DesignBlock "cwDull" "dull"
          [Value "COL" [TextE "Dull"] ] 
          (Inline True) colorColor [typeColor, typeColor]
          (Tooltip "Makes a color duller")

cwTranslucent = DesignBlock "cwTranslucent" "translucent"
          [Value "COL" [TextE "Translucent"] ] 
          (Inline True) colorColor [typeColor, typeColor]
          (Tooltip "Makes a color more translucent")

cwRGBA = DesignBlock "cwRGBA" "RGBA"
          [Dummy [TextE "RGBA"] 
           ,Value "RED"  [Text "Red"] 
           ,Value "GREEN"  [Text "Green"] 
           ,Value "BLUE"  [Text "Blue"] 
           ,Value "ALPHA"  [Text "Alpha"] ] 
          inlineDef colorColor [typeNumber, typeNumber, typeNumber, typeNumber, typeColor]
          (Tooltip "Makes a color with the given red, blue, green and alpha values")

-- LOGIC -------------------------------------------
conIf = DesignBlock "conIf" ""
        [ Value "IF"  [TextE "If"] 
         ,Value "THEN" [Text "then"]
         ,Value "ELSE" [Text "else"] 
         ]
         inlineDef colorPoly [typeBool, Poly 'a', Poly 'a', Poly 'a']
         (Tooltip "if condition is true then give a else b")

conAnd = DesignBlock "conAnd" "&&"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "and"] 
         ]
         (Inline True) colorBool [typeBool, typeBool, typeBool]
         (Tooltip "Logical AND operation")

conOr = DesignBlock "conOr" "||"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "or"] 
         ]
         (Inline True) colorBool [typeBool, typeBool, typeBool]
         (Tooltip "Logical OR operation")

conNot = DesignBlock "conNot" "not"
        [ Value "VALUE"  [TextE "Not"] ]
         (Inline True) colorBool [typeBool, typeBool]
         (Tooltip "Negation of the logical value")

conEq = DesignBlock "conEq" "==" 
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "="]
         ]
         (Inline True) colorPoly [Poly 'a', Poly 'a', typeBool]
         (Tooltip "Are two items equal")

conNeq = DesignBlock "conNeq" "/="
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "\x2260"] 
         ]
         (Inline True) colorPoly [Poly 'a', Poly 'a', typeBool]
         (Tooltip "Are two items not equal")

conTrue = DesignBlock "conTrue" "True"
          [Dummy 
            [TextE "True"]
          ]
          inlineDef colorBool [typeBool]
          (Tooltip "True logic value")

conFalse = DesignBlock "conFalse" "False"
          [Dummy 
            [TextE "False"]
          ]
          inlineDef colorBool [typeBool]
          (Tooltip "False logic value")

conGreater = DesignBlock "conGreater" ">"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE ">"] 
         ]
         (Inline True) colorBool [typeNumber, typeNumber, typeBool]
         (Tooltip "Tells whether one number is greater than the other")

conGeq = DesignBlock "conGeq" ">="
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "\x2265"] 
         ]
         (Inline True) colorBool [typeNumber, typeNumber, typeBool]
         (Tooltip "Tells whether one number is greater than or equal to ther other")

conLess = DesignBlock "conLess" "<"
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "<"] 
         ]
         (Inline True) colorBool [typeNumber, typeNumber, typeBool]
         (Tooltip "Tells whether one number is less than the other")

conLeq = DesignBlock "conLeq" "<="
        [ Value "LEFT"  [] 
         ,Value "RIGHT" [TextE "\x2264"] 
         ]
         (Inline True) colorBool [typeNumber, typeNumber, typeBool]
         (Tooltip "Tells whether one number is less than or equal to ther other")

conEven = DesignBlock "conEven" "even"
        [ Value "VALUE"  [TextE "Is Even"] ]
         (Inline True) colorBool [typeNumber, typeBool]
         (Tooltip "Tells whether the number is even")

conOdd = DesignBlock "conOdd" "odd"
        [ Value "VALUE"  [TextE "Is Odd"] ]
         (Inline True) colorBool [typeNumber, typeBool]
         (Tooltip "Tells whether the number is odd")

conStartWith = DesignBlock "conStartWith" "startWith"
          [Dummy [TextE "Starts With"] 
           ,Value "TEXTMAIN"  [Text "Text"] 
           ,Value "TEXTTEST"  [Text "starts with"] ] 
          inlineDef colorBool [typeText, typeText, typeBool] 
          (Tooltip "Tells whether the given text starts with some other text")

conEndWith = DesignBlock "conEndWith" "endWith"
          [Dummy [TextE "Ends With"] 
           ,Value "TEXTMAIN"  [Text "Text"] 
           ,Value "TEXTTEST"  [Text "ends with"] ]
          inlineDef colorBool [typeText, typeText, typeBool]
          (Tooltip "Tells whether the given text ends with some other text")

-- LISTS ----------------------------------------------
lstGenNum = DesignBlock "lstGenNum" ""
        [ Dummy [Text "["]
         ,Value "LEFT"  [] 
         ,Value "RIGHT" [TextE ".."] 
         ,Dummy [Text "]"]
         ]
         (Inline True) colorBool [typeNumber, typeNumber, typeBool]
         (Tooltip "Tells whether one number is greater than the other")



comment = DesignBlock "comment" ""
          [Dummy 
            [TextInput "" "TEXT",
            TextE "--"]
          ]
          inlineDef (Color 260) [typeComment]
          (Tooltip "Enter a comment")

getTypeBlocks :: [T.Text]
getTypeBlocks = map (\(DesignBlock name _ _ _ _ _ _) -> name) blockTypes

blockTypes = [ 
              -- PICTURE
              cwBlank
              ,cwCoordinatePlane
              ,cwCodeWorldLogo
              ,cwText
              ,cwDrawingOf
              ,cwCircle
              ,cwThickCircle
              ,cwSolidCircle
              ,cwRectangle
              ,cwThickRectangle
              ,cwSolidRectangle
              ,cwArc
              ,cwSector
              ,cwThickArc
              -- TRANSFORMATIONS
              ,cwColored
              ,cwTranslate
              ,cwCombine
              ,cwRotate
              ,cwScale
              -- NUMBERS
              --,numNumber
              ,numAdd
              ,numSub
              ,numMult
              ,numDiv
              ,numExp
              ,numMax
              ,numMin
              ,numOpposite
              ,numAbs
              ,numRound
              ,numReciprocal
              ,numQuot
              ,numRem
              ,numPi
              ,numSqrt
              ,numGCD
              ,numLCM
              -- TEXT
              ,txtConcat
              ,txtPrinted
              ,txtLowercase
              ,txtUppercase
              ,txtCapitalized
              -- COLORS
              ,cwBlue
              ,cwRed
              ,cwGreen
              ,cwBrown
              ,cwOrange
              ,cwBlack
              ,cwWhite
              ,cwCyan
              ,cwMagenta
              ,cwYellow
              ,cwAquamarine
              ,cwAzure
              ,cwViolet
              ,cwChartreuse
              ,cwRose
              ,cwPink
              ,cwPurple
              ,cwGray
              ,cwMixed
              ,cwLight
              ,cwDark
              ,cwBright
              ,cwDull
              ,cwTranslucent
              ,cwRGBA
              -- LOGIC
              ,conIf
              ,conAnd
              ,conOr
              ,conNot
              ,conEq
              ,conNeq
              ,conTrue
              ,conFalse
              ,conGreater
              ,conGeq
              ,conLess
              ,conLeq
              ,conEven
              ,conOdd
              ,conStartWith
              ,conEndWith
              ,comment
                ]

-- Assigns CodeGen functions defined here to the Blockly Javascript Code
-- generator
setBlockTypes :: IO ()
setBlockTypes = mapM_ setBlockType blockTypes
