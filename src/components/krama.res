open Types
open Belt.Array

@react.component
let make = (~words: words) => {
  let renderWord = (number, word) => {
    <div
      className="rounded bg-green-400 text-gray-50 font-semibold pb-4 text-center text-xl md:text-3xl sm:text-xl"
      key={number->Belt.Int.toString}>
      <div className="text-xs text-left text-opacity-25">
        <div className="bg-black px-1 tabluar-nums">
          {number->Belt.Int.toString->React.string}
        </div>
      </div>
      <div className="pt-2"> {React.string(word)} </div>
    </div>
  }

  let list = mapWithIndex(words, (index, word) => {
    renderWord(index + 1, word)
  })

  let krama_list = list => {
    concat(
      reduceWithIndex(list, [], (acc, _value, i) =>
        concat(acc, [getUnsafe(list, i), getUnsafe(list, i + 1)])
      ),
      [getUnsafe(list, length(list) - 1)],
    )
  }

  <div className="p-4 container mx-auto">
    <h1 className="text-4xl pb-4"> {`क्रम पाठ`->React.string} </h1>
    <div className="grid grid-cols-2 gap-4"> {krama_list(list)->React.array} </div>
  </div>
}
