// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Utils from "../utils.mjs";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function Jata(Props) {
  var words = Props.words;
  var jata_list = function (list) {
    return Belt_Array.concat(Belt_Array.reduceWithIndex(list, [], (function (acc, _value, i) {
                      return Belt_Array.concat(acc, [
                                  Utils.renderWord(i + 1 | 0, list[i], "bg-green-400", ""),
                                  Utils.renderWord(i + 2 | 0, list[i + 1 | 0], "bg-yellow-300", "text-gray-700"),
                                  Utils.renderWord(i + 2 | 0, list[i + 1 | 0], "bg-yellow-300", "text-gray-700"),
                                  Utils.renderWord(i + 1 | 0, list[i], "bg-green-400", ""),
                                  Utils.renderWord(i + 1 | 0, list[i], "bg-green-400", ""),
                                  Utils.renderWord(i + 2 | 0, list[i + 1 | 0], "bg-yellow-300", "text-gray-700")
                                ]);
                    })), []);
  };
  return React.createElement("div", {
              className: "p-4 container mx-auto"
            }, React.createElement("h1", {
                  className: "text-4xl pb-4"
                }, "जटा पाठ"), React.createElement("div", {
                  className: "grid grid-cols-6 gap-4"
                }, jata_list(words)));
}

var make = Jata;

export {
  make ,
  
}
/* Utils Not a pure module */
