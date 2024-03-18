import {Controller} from "@hotwired/stimulus"
import {get} from "@rails/request.js"
export default class extends Controller {
  static targets = ["main", "subcategory"]

  handler() {
    let categoryId = this.mainTarget.selectedOptions[0].value

    get(`/categories/${categoryId}/subcategories`, {
      responseKind: "turbo-stream"
    })
  }
}
