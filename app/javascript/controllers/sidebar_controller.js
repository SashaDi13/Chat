import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["configs", "burgerMenu"]
  static classes = ["hide"]

  toggle(e) {
    if (this.burgerMenuTarget.contains(e.target)) {
      this.configsTarget.classList.toggle(this.hideClass);
    } else {
      this.configsTarget.classList.add(this.hideClass);
    }
  }
}
