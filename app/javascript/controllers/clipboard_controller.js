// src/controllers/clipboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy(event) {
    navigator.clipboard.writeText(this.sourceTarget.value)
    alert('success')
  }
}