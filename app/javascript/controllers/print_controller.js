import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="print"
export default class extends Controller {
  connect() {
    print();
  }
}
