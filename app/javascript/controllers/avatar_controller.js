import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["avatar", "file"]

  handlePictureUpload(e) {
    const [file] = e.target.files;

    this.avatarTarget.style.backgroundSize = 'cover';
    this.avatarTarget.style.backgroundPosition = 'center';
    this.avatarTarget.style.backgroundImage = `url(${URL.createObjectURL(file)}`;
  }
}
