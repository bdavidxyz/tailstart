import { StreamActions } from "@hotwired/turbo";

StreamActions.focus = function () {
  const selector = this.getAttribute("selector");
  let elt = document.querySelector(selector);
  elt.focus();
};
