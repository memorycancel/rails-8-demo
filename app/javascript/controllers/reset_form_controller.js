import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]
  reset() {
    this.element.reset()
  }
}
