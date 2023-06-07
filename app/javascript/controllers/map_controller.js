import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [
    "state"
  ]
  connect() {
    console.log("hello")
    console.log(this.stateTargets)
    // this.stateTargets.forEach((state) => state.style.fill = "red")

  }
}
