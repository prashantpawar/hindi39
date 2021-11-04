open Promise

type words = array<string>
type action = SetWords(words)
type state = {words: words}

let reducer = (_state, action) => {
  switch action {
  | SetWords(words) => {words: words}
  }
}

@scope("JSON") @val
external parseIntoWords: string => words = "parse"

let initialState = {words: []}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  React.useEffect0(() => {
    let _ =
      Fetch.fetch("/hindi_curated.json")
      ->then(Fetch.Response.text)
      ->then(text => parseIntoWords(text)->resolve)
      ->then(words => Belt.Array.shuffle(words)->resolve)
      ->then(words => {
        Belt.Array.truncateToLengthUnsafe(words, 24)
        words->resolve
      })
      ->then(words => dispatch(SetWords(words))->resolve)
    None
  })

  let list = {
    Belt.Array.mapWithIndex(state.words, (index, word) => {
      <div
        className="rounded bg-green-400 text-gray-50 font-semibold pb-4 text-center text-xl md:text-3xl sm:text-xl"
        key={index->Belt.Int.toString}>
        <div className="text-xs text-left text-opacity-25">
          <div className="bg-black px-1"> {(index + 1)->Belt.Int.toString->React.string} </div>
        </div>
        <div className="pt-2"> {React.string(word)} </div>
      </div>
    })
  }
  <div className="p-4 container mx-auto">
    <div className="grid grid-cols-3 lg:grid-cols-8 md:grid-cols-6 sm:grid-cols-6 gap-4">
      {list->React.array}
    </div>
  </div>
}
