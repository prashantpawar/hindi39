open Types
open Belt.Array

/**
 * 01 02 02 01 01 02
 * 02 03 03 02 02 03
 * 03 04 04 03 03 04
 * 04 05 05 04 04 05
 * 05 06 06 05 05 06
 * 06 07 07 06 06 07
 * 07 08 08 07 07 08
 * 07 08 08 07 07 08
 * 09
 * 10
 * 11
 * 12
 * 13
 * 14
 * 15
 * 16
 * 17
 * 18
 * 19
 * 20
 * 21
 * 22
 * 23
 * 24
 */

@react.component
let make = (~words: words) => {
  let jata_list = list => {
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
            Utils.renderWord(
              ~number=i + 2,
              ~word=getUnsafe(list, i + 1),
              ~bgColorClass="bg-yellow-300",
              ~textColorClass="text-gray-700",
            ),
            Utils.renderWord(
              ~number=i + 1,
              ~word=getUnsafe(list, i),
              ~bgColorClass="bg-green-400",
              ~textColorClass="",
            ),
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
    <h1 className="text-4xl pb-4"> {`जटा पाठ`->React.string} </h1>
    <div className="grid grid-cols-6 gap-4"> {jata_list(words)->React.array} </div>
  </div>
}
