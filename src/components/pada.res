open Types

/**
 * 01
 * 02
 * 03
 * 04
 * 05
 * 06
 * 07
 * 08
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
  let list = {
    Belt.Array.mapWithIndex(words, (index, word) => {
      Utils.renderWord(~number=index + 1, ~word, ~bgColorClass="bg-green-400", ~textColorClass="")
    })
  }

  <div className="p-4 container mx-auto">
    <h1 className="text-4xl pb-4"> {`पद पाठ`->React.string} </h1>
    <div className="grid grid-cols-1 gap-4 max-w-xl m-auto"> {list->React.array} </div>
  </div>
}
