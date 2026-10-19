import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["wrapper"]

  toggle() {
    this.wrapperTarget.classList.toggle("sidebar--expanded")
  }
}
