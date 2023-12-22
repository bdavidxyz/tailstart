import { StreamActions } from "@hotwired/turbo";

StreamActions.replace_all_classes_by = function () {
  const selector = this.getAttribute("selector");
  const new_classes = this.getAttribute("new_classes");

  let elt = document.querySelector(selector);

  elt.className = new_classes;
};
