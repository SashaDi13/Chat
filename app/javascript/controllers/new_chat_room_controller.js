import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleable", "menu", "sidebar", "room"]
  static classes = ["hide"]

  connect() {
    console.log(this.sidebarTarget);
  }

  toggle() {
    this.toggleableTarget.classList.toggle(this.hideClass)
  }

  toggleMenu() {
    this.menuTarget.classList.toggle(this.hideClass);
  }

  toggleSidebar() {
    console.log(this.sidebarTarget);
    this.sidebarTarget.classList.toggle('hidden');
    this.roomTarget.classList.toggle('hidden');
    this.sidebarTarget.classList.toggle('flex-initial');
    this.sidebarTarget.classList.toggle('flex');
    this.roomTarget.classList.toggle('flex');
  }
}
