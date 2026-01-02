import {
  parse
} from "./chunk-34CABXMR.js";
import "./chunk-ALPIHS6N.js";
import "./chunk-SPF6KLLE.js";
import "./chunk-4Q2K2GLK.js";
import "./chunk-GCYFQ4XE.js";
import "./chunk-IE2NABQE.js";
import "./chunk-T6J7VCXI.js";
import "./chunk-VWPV3LC3.js";
import "./chunk-7FKETVVW.js";
import "./chunk-4ICRHXIS.js";
import {
  package_default
} from "./chunk-WMYMD4ZF.js";
import {
  selectSvgElement
} from "./chunk-FI4KQWQN.js";
import {
  configureSvgSize
} from "./chunk-Q6RCSGPJ.js";
import "./chunk-QSCUV4CX.js";
import "./chunk-T4KQPHTV.js";
import {
  __name,
  log
} from "./chunk-BCDUTBPZ.js";
import "./chunk-MYMU6UB3.js";
import "./chunk-FDBJFBLO.js";

// node_modules/mermaid/dist/chunks/mermaid.core/infoDiagram-WHAUD3N6.mjs
var parser = {
  parse: __name(async (input) => {
    const ast = await parse("info", input);
    log.debug(ast);
  }, "parse")
};
var DEFAULT_INFO_DB = {
  version: package_default.version + (true ? "" : "-tiny")
};
var getVersion = __name(() => DEFAULT_INFO_DB.version, "getVersion");
var db = {
  getVersion
};
var draw = __name((text, id, version) => {
  log.debug("rendering info diagram\n" + text);
  const svg = selectSvgElement(id);
  configureSvgSize(svg, 100, 400, true);
  const group = svg.append("g");
  group.append("text").attr("x", 100).attr("y", 40).attr("class", "version").attr("font-size", 32).style("text-anchor", "middle").text(`v${version}`);
}, "draw");
var renderer = { draw };
var diagram = {
  parser,
  db,
  renderer
};
export {
  diagram
};
//# sourceMappingURL=infoDiagram-WHAUD3N6-D27XEZ37.js.map
