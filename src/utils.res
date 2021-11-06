let str = React.string

let renderWord = (~number, ~word, ~bgColorClass, ~textColorClass) => {
  let className = `rounded text-gray-50 font-semibold pb-4 text-center text-xl md:text-3xl sm:text-xl ${bgColorClass} ${textColorClass}`

  <section className={className} key={number->Belt.Int.toString}>
    <div className="text-xs text-left text-opacity-25">
      <div className="bg-gray-500 px-1 tabluar-nums text-gray-50">
        {number->Belt.Int.toString->React.string}
      </div>
    </div>
    <div className="pt-2"> {React.string(word)} </div>
  </section>
}
