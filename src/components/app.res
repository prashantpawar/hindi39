open Promise
open Types

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

  <> <Pada words=state.words /> <Krama words=state.words /> </>
}
