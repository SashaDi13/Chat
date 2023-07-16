import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  removeValidation(e) {
    e.target.classList.remove('is-invalid');
    e.target.nextElementSibling.remove();
  }
}
