open Types

@react.component
let make = (~words: words) => {
  let list = {
    Belt.Array.mapWithIndex(words, (index, word) => {
      <div
        className="rounded bg-green-400 text-gray-50 font-semibold pb-4 text-center text-xl md:text-3xl sm:text-xl"
        key={index->Belt.Int.toString}>
        <div className="text-xs text-left text-opacity-25">
          <div className="bg-black px-1 tabluar-nums">
            {(index + 1)->Belt.Int.toString->React.string}
          </div>
        </div>
        <div className="pt-2"> {React.string(word)} </div>
      </div>
    })
  }

  <div className="p-4 container mx-auto">
    <h1 className="text-4xl pb-4"> {`पद पाठ`->React.string} </h1>
    <div className="grid grid-cols-3 lg:grid-cols-8 md:grid-cols-6 sm:grid-cols-6 gap-4">
      {list->React.array}
    </div>
  </div>
}
