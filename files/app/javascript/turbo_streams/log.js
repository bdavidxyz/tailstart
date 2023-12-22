import { StreamActions } from "@hotwired/turbo"

StreamActions.log = function() {
  const message = this.getAttribute("message")
  console.log(message)
}