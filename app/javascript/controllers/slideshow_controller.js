import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide" ]
  static values = { index: Number }

  next() {
    if (this.indexValue < 3) {
      this.indexValue++
    }
    else {
      this.indexValue -= 3;
    }
  }

  previous() {
    if (this.indexValue > 0)
    {
      this.indexValue--
    }
    else {
      this.indexValue += 3
    }
  }

  indexValueChanged() {
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index !== this.indexValue
    })
  }
}