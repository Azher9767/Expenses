import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["main", "subcategory"]

  connect() {
    console.log(this.mainTarget)
  }
  
  handler() {
    console.log(this.mainTarget.selectedOptions[0].value)
    const categoryId = this.mainTarget.selectedOptions[0].value
    fetch(`/categories/${categoryId}/subcategories`)
      .then(response => response.json())
      .then(data => {
        this.subcategoryTarget.disabled = false
        // Clear existing options
        this.subcategoryTarget.innerHTML = '';

        // Add a default option (optional)
        const defaultOption = document.createElement('option');
        defaultOption.textContent = 'Select a subcategory';
        defaultOption.value = '';
        this.subcategoryTarget.appendChild(defaultOption);

        // Iterate over each subcategory and append it as an option
        data.forEach(subcategory => {
          const option = document.createElement('option');
          option.value = subcategory.id; // Assuming your subcategories have 'id' 
          option.textContent = subcategory.name; // And 'name' properties
          this.subcategoryTarget.appendChild(option);
        });
      })
      .catch(error => console.error('Error fetching subcategories:', error));
  }
}
