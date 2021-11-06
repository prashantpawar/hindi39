open Types
open Belt.Array

/**
 * 01 02
 * 02 03
 * 03 04
 * 04 05
 * 05 06
 * 06 07
 * 07 08
 * 08 09
 * 09 10
 * 10 11
 * 11 12
 * 12 13
 * 13 14
 * 14 15
 * 15 16
 * 16 17
 * 17 18
 * 18 19
 * 19 20
 * 20 21
 * 21 22
 * 22 23
 * 23 24
 * 24 24
 */

@react.component
let make = (~words: words) => {
  let krama_list = list => {
    concat(
      reduceWithIndex(list, [], (acc, _value, i) =>
        concat(
          acc,
          [
            Utils.renderWord(
              ~number=i + 1,
              ~word=getUnsafe(list, i),
              ~bgColorClass="bg-green-400",
              ~textColorClass="",
            ),
            Utils.renderWord(
              ~number=i + 2,
              ~word=getUnsafe(list, i + 1),
              ~bgColorClass="bg-yellow-300",
              ~textColorClass="text-gray-700",
            ),
          ],
        )
      ),
      [],
    )
  }

  <div className="p-4 container mx-auto">
    <h1 className="text-4xl pb-4"> {`क्रम पाठ`->React.string} </h1>
    <div className="grid grid-cols-2 gap-4"> {krama_list(words)->React.array} </div>
  </div>
}
