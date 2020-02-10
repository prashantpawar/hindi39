var splitter = new GraphemeSplitter();

var tap = (x => { console.log(x); return x; });
var app = new Vue({
  el: '#app',
  data() {
    return {
      items: null,
      raw: null,
    }
  },
  mounted() {
    axios
      .get('/random')
      .then(response => {
        this.items = _.flow(
          _.map(word => ({
            label: word.word,
            length: splitter.countGraphemes(word.word),
          })),
          (x => {this.raw = x; return x;}),
          _.chunk(8),
        )(response.data);
        this.rowGraphemeSum = _.flow(
          _.map(x => _.map('length', x)),
          _.map(x => {
            return _.sum(x)
          })
        )(this.items);
      })
  }
})