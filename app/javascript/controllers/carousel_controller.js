import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = [
    "prev",
    "next"
  ]
  connect() {
    // console.log("hello")
    // console.log(this.prevTarget)
    // console.log(this.nextTarget)
  }

  prev(event) {
    console.log(event)
  }

  next(event) {
    console.log(event)
  }
}
