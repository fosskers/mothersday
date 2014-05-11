-- A Mother's Day site for Mom

import Window

hearts : Element
hearts = image 370 237 "/hearts.gif"

mom : Element
mom = image 285 304 "/mom.jpg"

pics : Element
pics = flow left [ hearts, mom, hearts ]

message : Element
message = [markdown|
# <span style="color:red;">Happy Mothers Day, Mom!</span>
|]

center : Int -> Element -> Element
center w e = container w (heightOf e) middle e

content : Int -> Element
content w = flow down [ center w pics, center w message ]

background : Int -> Int -> Element
background w h = container w h middle <| image w h "/mountains.jpg"

render : (Int,Int) -> Element
render (w,h) = layers [ background w h
                      , container w h middle <| content w
                      ]

main : Signal Element
main = render <~ Window.dimensions
