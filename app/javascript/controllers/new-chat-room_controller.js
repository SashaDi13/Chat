import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleable", "menu"]
  static classes = ["hide"]

  toggle() {
    this.toggleableTarget.classList.toggle(this.hideClass)
  }

  toggleMenu() {
    this.menuTarget.classList.toggle(this.hideClass);
  }
}
