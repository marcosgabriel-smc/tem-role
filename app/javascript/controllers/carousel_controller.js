import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = [
    "prev",
    "next"
  ]
  connect() {
    console.log("hello")
    console.log(this.prevTarget)
    console.log(this.nextTarget)
  }
}
