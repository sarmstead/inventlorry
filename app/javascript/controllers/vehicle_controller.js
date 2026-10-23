import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="vehicle"
export default class extends Controller {
  static targets = ["make", "model", "trim", "create"];
  static values = {
    initialMake: String,
    initialModel: String,
    initialTrim: String,
  };

  classes = { selected: "selected" };

  async connect() {
    if (this.initialMakeValue) {
      this.makeTarget.value = this.initialMakeValue;
      await this.selectMake();
    }

    if (this.initialModelValue) {
      this.modelTarget.value = this.initialModelValue;
      await this.selectModel();
    }

    if (this.initialTrimValue) {
      this.trimTarget.value = this.initialTrimValue;
      await this.selectTrim();
    }
  }

  async selectMake() {
    const fetchedModels = await fetch(`/makes/${this.makeTarget.value}/models`);
    const models = await fetchedModels.json();
    if (models.length > 0) {
      this.modelTarget.replaceChildren();
      const emptyOption = document.createElement("option");
      emptyOption.innerText = "-- select model --";
      emptyOption.value = -1;
      this.modelTarget.appendChild(emptyOption);

      models.forEach((model) => {
        const option = document.createElement("option");
        option.innerText = model.name;
        option.value = model.id;
        this.modelTarget.appendChild(option);
      });
      this.makeTarget.classList.add(this.classes.selected);
      this.modelTarget.disabled = false;
    } else {
      disableMakeField();
      disableModelField();
      disableTrimField();
      this.createTarget.disabled = true;
    }
  }

  async selectModel() {
    const fetchedTrims = await fetch(`/models/${this.modelTarget.value}/trims`);
    const trims = await fetchedTrims.json();
    if (trims.length > 0) {
      this.trimTarget.replaceChildren();
      const emptyOption = document.createElement("option");
      emptyOption.innerText = "-- select trim --";
      emptyOption.value = -1;
      this.trimTarget.appendChild(emptyOption);

      trims.forEach((trim) => {
        const option = document.createElement("option");
        option.innerText = trim.name;
        option.value = trim.id;
        this.trimTarget.appendChild(option);
      });
      this.modelTarget.classList.add(this.classes.selected);
      this.trimTarget.disabled = false;
    } else {
      disableMakeField();
      disableModelField();
      disableTrimField();
      this.createTarget.disabled = true;
    }
  }

  selectTrim() {
    if (this.trimTarget.value !== -1) {
      this.createTarget.disabled = false;
    } else {
      return;
    }
  }

  disableMakeField() {
    this.makeTarget.value = -1;
    this.makeTarget.disabled = true;
  }

  disableModelField() {
    this.modelTarget.value = -1;
    this.modelTarget.disabled = true;
  }

  disableTrimField() {
    this.trimTarget.value = -1;
    this.trimTarget.disabled = true;
  }
}
