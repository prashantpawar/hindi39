open Promise

type buffer = {toString: (. unit) => string}
@module("fs/promises") external readFile: string => Js.Promise.t<buffer> = "readFile"

let hindi_words = _ =>
  readFile("./hindi/hindi_wordlist_bool.csv")
  ->then(data => {
    resolve(data.toString(.))
  })
  ->then(raw_data => {
    let lines = Js.String.split("\r\n", raw_data)
    Js.Array.filter(line => {
      let row = Js.String.split(",", line)
      Belt.Array.getUnsafe(row, 1) === "TRUE"
    }, lines)->resolve
  })
  ->then(words => {
    Belt.Array.map(words, word => {
      let row = Js.String.split(",", word)
      Belt.Array.getUnsafe(row, 0)
    })->resolve
  })
