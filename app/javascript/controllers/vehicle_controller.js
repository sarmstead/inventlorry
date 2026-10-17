import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="vehicle"
export default class extends Controller {
  static targets = ["make", "model", "trim"];
  classes = { selected: "selected" };

  connect() {}

  async selectMake(e) {
    const fetchedModels = await fetch(`/makes/${this.makeTarget.value}/models`);
    const models = await fetchedModels.json();
    if (models.length > 0) {
      models.forEach((model) => {
        const option = document.createElement("option");
        option.innerText = model.name;
        option.value = model.id;
        this.modelTarget.appendChild(option);
      });
      this.makeTarget.disabled = true;
      this.makeTarget.classList.add(this.classes.selected);
      this.modelTarget.disabled = false;
    } else {
      return;
    }
  }

  createVehicle(event) {
    event.preventDefault();
    const makeSelected = this.makeTarget.value !== -1;
    const modelSelected = this.modelTarget.value !== -1;
    const trimSelected = this.trimTarget.value !== -1;
    if (makeSelected && modelSelected && trimSelected) {
      // create vehicle via API request
    }
  }
}
